import 'package:flutter/material.dart';
class AnimatedTextField extends StatefulWidget {
  Color primaryColor,beginColor,endColor;
  String label;
  IconData icon;
  Duration duration;

  AnimatedTextField({
    super.key,
    required this.primaryColor,
    required this.beginColor,
    required this.endColor,
    required this.label,
    required this.icon,
    required this.duration,

  });

  @override
  State<AnimatedTextField> createState() => _AnimatedTextFieldState();
}
class _AnimatedTextFieldState extends State<AnimatedTextField>with SingleTickerProviderStateMixin {
  @override
  late AnimationController _animationController;
  late Animation _scaleAnimation;
  late Animation _colorAnimation;
  FocusNode _focusNode = FocusNode();
  final emailController=TextEditingController();
  late String name;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: widget.duration);
    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.0).animate(_animationController);
    _colorAnimation =
        ColorTween(begin: widget.beginColor, end: widget.endColor).animate(
            _animationController);
    _focusNode.addListener(_onTextFieldFocusChange);
    _animationController.addListener(() {
      setState(() {});
    });
  }
  void _onTextFieldFocusChange() {
    if (_focusNode.hasFocus) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }


  Widget build(BuildContext context) {
    return Padding(padding:const EdgeInsets.symmetric(vertical: 5,horizontal: 30),
     key: formKey,
     child:SizedBox(
       height: 60,
       width: 350,
      child: Stack(
        children: [
                 Transform.scale(
                  scaleX: _scaleAnimation.value,
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.primaryColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                 ),

          TextFormField(
            focusNode: _focusNode,
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            decoration: InputDecoration(
              label: Text(
                widget.label, style: TextStyle(color: _colorAnimation.value),
              ),
              border: InputBorder.none,
              focusedBorder: const OutlineInputBorder(),
              prefixIcon: Icon(widget.icon, color: _colorAnimation.value),

            ),
            validator: ( value){
              if(value!.isEmpty)
              {
                return 'Please Enter Name';
              }
              return null;
            },
            onSaved: ( value){
              name =  name;
            },
          ),



        ],

      ),

    ),
    );
  }
}



class AnimatedTextFieldPassword extends StatefulWidget {
  Color primaryColor,beginColor,endColor;
  String label;
  IconData icon;
  Duration duration;

  AnimatedTextFieldPassword({
    super.key,
    required this.primaryColor,
    required this.beginColor,
    required this.endColor,
    required this.label,
    required this.icon,
    required this.duration,

  });

  @override
  State<AnimatedTextFieldPassword> createState() => _AnimatedTextFieldPasswordState();
}
class _AnimatedTextFieldPasswordState extends State<AnimatedTextFieldPassword>with SingleTickerProviderStateMixin {
  @override
  late AnimationController _animationController;
  late Animation _scaleAnimation;
  late Animation _colorAnimation;
  bool secureText = true;
  FocusNode _focusNode = FocusNode();
  final passlController=TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: widget.duration);
    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.0).animate(_animationController);
    _colorAnimation =
        ColorTween(begin: widget.beginColor, end: widget.endColor).animate(
            _animationController);
    _focusNode.addListener(_onTextFieldFocusChange);
    _animationController.addListener(() {
      setState(() {});
    });
  }

  void _onTextFieldFocusChange() {
    if (_focusNode.hasFocus) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  /*late bool _isSecurePassword=true;*/
  Widget build(BuildContext context) {
    return
    Padding(padding:const  EdgeInsets.symmetric(vertical:5.0 ,horizontal:30.0 ),
     child: SizedBox(
      width: 320,
      height: 50,
      child: Stack(
        children: [
          LayoutBuilder(
              builder: (_, constraints) {
                return Transform.scale(
                  scaleX: _scaleAnimation.value,
                  origin: Offset(constraints.maxWidth / 2, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.primaryColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),

                );
              }),

          TextField(
            focusNode: _focusNode,
            obscureText: secureText,
            controller: passlController,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      secureText = !secureText;
                    });
                  },
                  icon: Icon(
                    secureText ? Icons.visibility_off : Icons.visibility,color: _colorAnimation.value,)),
              label: Text(
                widget.label, style: TextStyle(color: _colorAnimation.value),
              ),
              border: InputBorder.none,
              focusedBorder: const OutlineInputBorder(),
              prefixIcon: Icon(widget.icon, color: _colorAnimation.value),
            ),
          ),

        ],

      ),
     ),
    );
  }
}





class AnimatedTextFieldConfirmPassword extends StatefulWidget {
  Color primaryColor,beginColor,endColor;
  String label;
  IconData icon;
  Duration duration;

  AnimatedTextFieldConfirmPassword({
    super.key,
    required this.primaryColor,
    required this.beginColor,
    required this.endColor,
    required this.label,
    required this.icon,
    required this.duration,

  });

  @override
  State<AnimatedTextFieldPassword> createState() => _AnimatedTextFieldPasswordState();
}
class _AnimatedTextFieldConfirmPasswordState extends State<AnimatedTextFieldPassword>with SingleTickerProviderStateMixin {
  @override
  late AnimationController _animationController;
  late Animation _scaleAnimation;
  late Animation _colorAnimation;

  bool secureText = true;
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: widget.duration);
    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.0).animate(_animationController);
    _colorAnimation =
        ColorTween(begin: widget.beginColor, end: widget.endColor).animate(
            _animationController);
    _focusNode.addListener(_onTextFieldFocusChange);
    _animationController.addListener(() {
      setState(() {});
    });
  }

  void _onTextFieldFocusChange() {
    if (_focusNode.hasFocus) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  /*late bool _isSecurePassword=true;*/
  Widget build(BuildContext context) {

    return
      Padding(padding:const  EdgeInsets.symmetric(vertical:5.0 ,horizontal:30.0 ),
        child: SizedBox(
          width: 320,
          height: 50,
          child: Stack(
            children: [
              LayoutBuilder(
                  builder: (_, constraints) {
                    return Transform.scale(
                      scaleX: _scaleAnimation.value,
                      origin: Offset(constraints.maxWidth / 2, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: widget.primaryColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),

                    );
                  }),

              TextField(
                focusNode: _focusNode,
                obscureText: secureText,

                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          secureText = !secureText;
                        });
                      },
                      icon: Icon(
                        secureText ? Icons.visibility_off : Icons.visibility,color: _colorAnimation.value,)),
                  label: Text(
                    widget.label, style: TextStyle(color: _colorAnimation.value),
                  ),
                  border: InputBorder.none,
                  focusedBorder: const OutlineInputBorder(),
                  prefixIcon: Icon(widget.icon, color: _colorAnimation.value),
                ),
              ),

            ],

          ),
        ),
      );
  }
}



