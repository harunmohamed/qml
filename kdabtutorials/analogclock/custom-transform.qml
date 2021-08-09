import QtQuick 2.0

Rectangle{
    width: 400; height: 400; rotation: -45; scale: 1.5

    gradient: Gradient{
        GradientStop {position: 0.15; color: 'red'}
        GradientStop {position: 0.3; color: 'orange'}
        GradientStop {position: 0.45; color: 'yellow'}
        GradientStop {position: 0.6; color: 'green'}
        GradientStop {position: 0.75; color: 'blue'}
        GradientStop {position: 0.9; color: 'indigo'}
        GradientStop {position: 1.0; color: 'violet'}
    }
}
