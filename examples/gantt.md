```mermaid
gantt
    %%dateFormat HH:mm
    axisFormat  %d-%m-%Y
    dateFormat DD-MM-YYYY

    title Plan till internal demo - 15 Aug 
    excludes weekends


    Start  : milestone, m0, 13-07-2021
    sla-negotiator-bare-bones : active, s1, 5d
    vn-micropayment-bare-bones : v1,after s1, 5d

    sla-negotiator : s2, after v1, 7d
    vn-micropayment : v2, after s2, 6d

    Demo milestone : milestone, mN, 15-08-2022, 2min
```