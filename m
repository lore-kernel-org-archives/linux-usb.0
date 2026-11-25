Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795570432;
	b=iHSTDSjk8ao1Xd+dFa28bUpMIbjnPm/ibi6wFvn9D4SDwH5mA7F4pvESieoEnkO2LU0B
	 1BtEt4t4f77tmnHKq4zwPjyW83l+wckHjscyqOZea9SMkHO0BCdqCLaQU+TeByikHpgEB
	 SqdQcIeYdv3qr6Q4x4xIqnpL/nxvK9jIYj+IgdA1m92higAQ5lz7ZJwUC24dpC1qEphr3
	 KRCumPux92Ka0DIQvB0XGkQIess5wgeUqkrwGRIrlI2JjwUE1d1kvH8er7L8RID1sWKXK
	 stL5n6arDpaVlGXMXyta7285YHyollFG0vLqe01CLCFHJ2sKnKPOlQmw3nNDe3c911A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2gip1NK0wBgJYUEfPwhQ0iwa8xhKGiGvuEG2VPSq03s=;
	b=x8faAh8vn9mx2Pz6pZlpjnJfyGBSXMud96GoqDBiqXCgxhJhhbK51uoXM6xl/slw2tii
	 ZuiTo0WEnxFSeZgmQTk4yIN8ORfuhZ7UoRyYX7EWa6VJJSNNqG3KlxNyWz1/TLsSFs2kB
	 RyLN2NJY1k/n2GXMJpT0ImzZwjrAD1Ad3RvlvWEnI+AZd6BNs6ODdevpS8nIActqL1dTO
	 rBGmNv4/iapaBAiNll8UidMXGWj/Rw6xICsABB3B+eCKWefWhAIm5SNxFG8IDtBkjwOuZ
	 QjItm4haSI/K8ue38iAheWcPYHqbzHZyGQxgUOIKHla2ITlEMqp87d/YKSLnfy0VOlw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yk0LCVlg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FD1606A321
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 01:33:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15FD1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yk0LCVlg
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-475920b9ca2so1775212fac.1
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 17:33:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795570431; cv=none;
        d=google.com; s=arc-20260327;
        b=BigTSzj89H8ooTSS2Wt9h/LflYQMSrqX56q9zni4lLikNek2ez2uXgZk3MErRdPQg4
         olNhRB8wRmcSlfzUds/Ynib/ELG8ix6moZe0GSD0QY3GfVlVzXlhJ8MZLk3NG+WkxtTA
         ofK58VGsKg7OpG9kdC2td4Bv8dBLjbloIy24vQ3KRzQVZQFSD9w4UjOb3kmdulQU16hl
         AUw1+69OLF2+xPM2an3bQyxrrECQo1jW+S6SpMjflAdI1+1pJIp4MeO8Y8MfcuA+t/tn
         rke9F+zjJBDON4gV4aU17iZKWqgzEESJl4PhwZc7zteSjmUU23bPOWn1QfDjnqsD0b5C
         fdOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2gip1NK0wBgJYUEfPwhQ0iwa8xhKGiGvuEG2VPSq03s=;
        fh=rKw7VZySAlVMPOQ9nvleG1SXYJ98WPlt9SolnUAuMAI=;
        b=EGSQ1aH2mONklfGrcHxV042wtdRgF7+R8qdlrhQQqCS1voMkgeVGxKxfyBUjgyfDU3
         6uc7fXtg3fS0DybDMHeJezzerRnE0vt9nxs2YbTQ8mKwlJ4D6sFxCAiRXYREMDRPpKYv
         qOSAlvNdOmHP8mAkUffR5lQ5sPJJASZMGmSijgw7IJYJq2XUJJDehn9/+TRYVZBUplRQ
         LIajmncF/im8hveKALFVxrCXgIVHT74sJ+z+Otm+Ai+85oIO4hQjo6PUoitRWnI4+keq
         Gg21h+qCPUtSTQBVpSNSgCYPaDLeXafZvTdZX5FvM5OhZ9Am1IA4cKl0049j0GKI9nMr
         Wrag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795570431; x=1796175231; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2gip1NK0wBgJYUEfPwhQ0iwa8xhKGiGvuEG2VPSq03s=;
        b=yk0LCVlgOmnU4D9i3CfR+hOfBJAC/XLTsmFpbB0pkEVbJRS4GQUEPPFBo5DSZ29Al7
         KM9EXI/MHZs3APRb+c3Kp8jRcj6BpExFU7rSZJX9NmHKt79Dsgw8cUtlidO8Rk9a+y3n
         ebogyhIuhfqqHKHyWrrc0Mb37tYDKOX+XxjN0dFTvbo9aTzTur548g5B7cqeeRQZsEOW
         yRuP6DWd/jRtrGEAK1gGp4Y+sD4UqU1JXdfoUY9Ok4p+YiiG5pxjkohoMeKo7SycoVUV
         BXqFLXlLBlMAZrlY3DIuG2ohnGkV0bo3SKxTCmGhchb4RvMVvNkC8asw7YyAC6A9I6jV
         M+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795570431; x=1796175231;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2gip1NK0wBgJYUEfPwhQ0iwa8xhKGiGvuEG2VPSq03s=;
        b=D0eu+GqFmCR7cr9qnHmu8Q+1qgrvs/6/EIQLmu8V84V+MJumJmr+8WhXBO1KuhGBAH
         h3Yi8DLL5x//ugQw3OfqWuMXUnum/SqxUfncQ44sDyFwIVbmgOuWXbn6wkLT5sZHx9h6
         uBnBR5RGErw6uLV6LtYGDq04EWLxTRudfWDt+D/4kTi9yRf9uQvnXJPM0wrvX3QEcIGl
         sra7ntWmfotdX4550MUREEUv9uK1Zx67M79qpmMjMmcR5wcCMcyUedK/Nq2oHky1hOd0
         8uhdaq20Bo9mJvsZmlR3k/a5gLN5D6HytPntGf+x6kZxe2Rp2OIFj7DLZhtE6iAVLnni
         FxRw==
X-Forwarded-Encrypted: i=1; AL+hErE2o/3Mi1g5BmCIn/691q6P/MX+C4ZoHP2p3t7AqbIwARZ+HvZhDKcl48FeYcIGVSv9/EbzV3G8yxY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mnQgmg/w8lavx7+G4RIvQyNgRJ5UOi8tqcSEIVyNuVG1qDSft
	vhEhwpJD6S++AA6xkxZ40/RwPlt843McY79qzC+hIa7U9ckmOQXL+yRQa0yfQnJRngpcsuiXuJB
	vW6084lFrVz+cZ42vDW7EPKUIqX0waNtBcM0P
X-Gm-Gg: AZFdTZdCD5CrNRVlMIMm11YRuyO5PY7U6snVVFrh25QVEb7TDrryuF/+E/8zNAS/98O
	6tZmEsbCe1cK9AfmAmv571k7wd8EKMCdRcvmGo1mPCcAxgdYdJLCC7WuEmPqPHvOQjxorbLZi8P
	eOn6bPO6cITTtF3oHHQlJaBO2bh1bNEdHtflzdpWhOF0HH24qUvLankWBIliPpmWKkOfFr5hOh8
	Gh7IWjKnQfiEQ9DfbmfczF3Eyh8QOzeN3H0K9tOSwjhMrF1WxRubcsdcQc3c535weL9m7TvTZ+S
	DzS6OCrWVd9o+8EP35PWC0SqO9OZhfuZAa7sI943KWZZXroYINupbfBV4sl+MnBaUmODYyMEl83
	39gwjhwr8GKzCWvFc23gCpOKifJf65J236AJNc1R/
X-Received: by 2002:a05:6808:23ca:b0:571:ceaa:3e29 with SMTP id
 5614622812f47-57a035c721emr20126919b6e.0.1795570430804; Tue, 24 Nov 2026
 17:33:50 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123072320.5967-1-ki.chiang65@gmail.com> <20261123122343.6d3f8866.michal.pecio@gmail.com>
In-Reply-To: <20261123122343.6d3f8866.michal.pecio@gmail.com>
From: Kuangyi Chiang <ki.chiang65@gmail.com>
Date: Wed, 25 Nov 2026 09:33:38 +0800
X-Gm-Features: Aa3M54o4sBnpfJ7sTPNKoH-u4KSZQxGsSF95VQe859Y3yKpAPoeTSt-tRM9-78g
Message-ID: <CAHN5xi2dFo2NFbMb8t_5uugX56Fq2=Jj3G2_5xA0-b_NTjQsSg@mail.gmail.com>
Subject: Re: [PATCH RESEND] xhci: Handle missing USB2 resume events on Etron hosts
To: Michal Pecio <michal.pecio@gmail.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for testing and sharing the detailed logs.

Michal Pecio <michal.pecio@gmail.com> =E6=96=BC 2026=E5=B9=B411=E6=9C=8823=
=E6=97=A5=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=887:23=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> This repro doesn't seem to work for me.
> [...]

I tested again on an EJ188 with three USB2 hubs connected, without the
proposed fix but with extra local debug messages to detect ports that
are in the resume state without a Port Status Change Event.

When I connected the first mouse to hub 3, I saw the same behavior as
in your test: the USB core checked all root hub ports, and all three
hubs completed resume (evt 000e).

However, when I connected a second mouse to hub 2, the root hub was
already active. Port 1 also entered the resume state without an event,
but only port 2 was reported in the status bitmap (evt 0004).

Both mice worked, but a third mouse connected to hub 1 had no effect.

So the issue seems to occur when another suspended port enters the
resume state while the root hub is already active.

Here are the test logs:

02:00.0 USB controller: Etron Technology, Inc. EJ188/EJ198 USB 3.0
Host Controller
/:  Bus 005.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd/4p, 480M
    |__ Port 001: Dev 004, If 0, Class=3DHub, Driver=3Dhub/7p, 480M
    |__ Port 002: Dev 005, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
    |__ Port 003: Dev 006, If 0, Class=3DHub, Driver=3Dhub/4p, 480M

# connecting a mouse to hub 3 resumes the bus:
[ 3613.057015] xhci_hcd 0000:02:00.0: Port change event, 5-3, id 3,
portsc: 0xc400fe3
[ 3613.057091] xhci_hcd 0000:02:00.0: resume root hub
[ 3613.057106] xhci_hcd 0000:02:00.0: port resume event for port 3
[ 3613.057114] xhci_hcd 0000:02:00.0: resume HS port 3
[ 3613.057122] xhci_hcd 0000:02:00.0: USB2 port 1 resumed without
event, portsc: 0xc000fe3
[ 3613.057129] xhci_hcd 0000:02:00.0: USB2 port 2 resumed without
event, portsc: 0xc000fe3
[ 3613.057170] usb usb5: usb wakeup-resume
[ 3613.057184] usb usb5: usb auto-resume
[ 3613.057206] hub 5-0:1.0: hub_resume

# core checks all RH ports; ports 1, 2 and 3 are resuming:
[ 3613.057221] xhci_hcd 0000:02:00.0: Get port status 5-1 read: 0xfe3,
return 0x507
[ 3613.057269] usb usb5-port1: status 0507 change 0000
[ 3613.057284] xhci_hcd 0000:02:00.0: Get port status 5-2 read: 0xfe3,
return 0x507
[ 3613.057317] usb usb5-port2: status 0507 change 0000
[ 3613.057331] xhci_hcd 0000:02:00.0: Get port status 5-3 read: 0xfe3,
return 0x507
[ 3613.057361] usb usb5-port3: status 0507 change 0000
[ 3613.057376] xhci_hcd 0000:02:00.0: Get port status 5-4 read: 0x2a0,
return 0x100
[ 3613.057416] hub 5-0:1.0: state 7 ports 4 chg 0000 evt 0000
[ 3613.057728] hub 5-0:1.0: state 7 ports 4 chg 0000 evt 0000
[ 3613.295602] hub 5-0:1.0: state 7 ports 4 chg 0000 evt 000e

# hub 1 is resumed, inspected and suspended again
[ 3613.295628] xhci_hcd 0000:02:00.0: resume USB2 port 5-1
[ 3613.295639] xhci_hcd 0000:02:00.0: Set port 5-1 link state, portsc:
0xfe3, write 0x10e01
[ 3613.295743] xhci_hcd 0000:02:00.0: Port change event, 5-1, id 1,
portsc: 0x400e03
[ 3613.295774] xhci_hcd 0000:02:00.0: Get port status 5-1 read: 0xfe3,
return 0x40503
[ 3613.295819] xhci_hcd 0000:02:00.0: clear port1 suspend/resume
change, portsc: 0xe03
[ 3613.306530] usb 5-1: usb wakeup-resume
[ 3613.306558] xhci_hcd 0000:02:00.0: Get port status 5-1 read: 0xe03,
return 0x503
[ 3613.317615] usb 5-1: Waited 0ms for CONNECT
[ 3613.317626] usb 5-1: finish resume
[ 3613.318018] hub 5-1:1.0: hub_resume
[ 3613.320288] usb usb5-port1: resume, status 0
[ 3613.320306] xhci_hcd 0000:02:00.0: resume USB2 port 5-2
[ 3613.320316] xhci_hcd 0000:02:00.0: Set port 5-2 link state, portsc:
0xfe3, write 0x10e01
[ 3613.320340] hub 5-1:1.0: state 7 ports 7 chg 0000 evt 0000
[ 3613.320381] hub 5-1:1.0: hub_suspend
[ 3613.321518] xhci_hcd 0000:02:00.0: Set port 5-1 link state, portsc:
0xe03, write 0x10e61

# hub 2 is resumed, inspected and suspended again
[ 3613.331561] usb 5-2: usb wakeup-resume
[ 3613.331592] xhci_hcd 0000:02:00.0: Get port status 5-2 read: 0xe03,
return 0x503
[ 3613.332562] usb 5-1: usb auto-suspend, wakeup 1
[ 3613.342518] usb 5-2: Waited 0ms for CONNECT
[ 3613.342532] usb 5-2: finish resume
[ 3613.343274] hub 5-2:1.0: hub_resume
[ 3613.345374] usb usb5-port2: resume, status 0
[ 3613.345393] xhci_hcd 0000:02:00.0: resume USB2 port 5-3
[ 3613.345403] xhci_hcd 0000:02:00.0: Set port 5-3 link state, portsc:
0xfe3, write 0x10e01
[ 3613.345427] hub 5-2:1.0: state 7 ports 4 chg 0000 evt 0000
[ 3613.345439] xhci_hcd 0000:02:00.0: Port change event, 5-3, id 3,
portsc: 0x400e03
[ 3613.345497] xhci_hcd 0000:02:00.0: Get port status 5-3 read: 0xfe3,
return 0x40503
[ 3613.345548] xhci_hcd 0000:02:00.0: clear port3 suspend/resume
change, portsc: 0xe03
[ 3613.347649] hub 5-2:1.0: hub_suspend
[ 3613.348842] xhci_hcd 0000:02:00.0: Set port 5-2 link state, portsc:
0xe03, write 0x10e61

# hub 3 is resumed, inspected and the device enabled
[ 3613.356604] usb 5-3: usb wakeup-resume
[ 3613.356628] xhci_hcd 0000:02:00.0: Get port status 5-3 read: 0xe03,
return 0x503
[ 3613.359576] usb 5-2: usb auto-suspend, wakeup 1
[ 3613.368504] usb 5-3: Waited 0ms for CONNECT
[ 3613.368515] usb 5-3: finish resume
[ 3613.368981] hub 5-3:1.0: hub_resume
[ 3613.370094] usb 5-3-port4: status 0101 change 0001
[ 3613.471650] usb usb5-port3: resume, status 0
[ 3613.471671] hub 5-3:1.0: state 7 ports 4 chg 0010 evt 0000
[ 3613.472020] usb 5-3-port4: status 0101, change 0000, 12 Mb/s
[ 3613.543564] xhci_hcd 0000:02:00.0: xhci_hub_status_data: stopping
usb5 port polling
[ 3613.544505] usb 5-3.4: new full-speed USB device number 7 using xhci_hcd

# connecting a second mouse to hub 2 resumes port 2:
[ 3622.523436] xhci_hcd 0000:02:00.0: Port change event, 5-2, id 2,
portsc: 0x400fe3
[ 3622.523492] xhci_hcd 0000:02:00.0: port resume event for port 2
[ 3622.523499] xhci_hcd 0000:02:00.0: resume HS port 2
[ 3622.523507] xhci_hcd 0000:02:00.0: USB2 port 1 resumed without
event, portsc: 0xfe3
[ 3622.564503] hub 5-0:1.0: state 7 ports 4 chg 0000 evt 0004
[ 3622.564530] xhci_hcd 0000:02:00.0: resume USB2 port 5-2
[ 3622.564541] xhci_hcd 0000:02:00.0: Set port 5-2 link state, portsc:
0xfe3, write 0x10e01
[ 3622.564651] xhci_hcd 0000:02:00.0: Port change event, 5-2, id 2,
portsc: 0x400e03
[ 3622.564684] xhci_hcd 0000:02:00.0: Get port status 5-2 read: 0xfe3,
return 0x40503
[ 3622.564744] xhci_hcd 0000:02:00.0: clear port2 suspend/resume
change, portsc: 0xe03

# hub 2 is resumed, inspected and the device enabled
[ 3622.575423] usb 5-2: usb wakeup-resume
[ 3622.575451] xhci_hcd 0000:02:00.0: Get port status 5-2 read: 0xe03,
return 0x503
[ 3622.586477] usb 5-2: Waited 0ms for CONNECT
[ 3622.586487] usb 5-2: finish resume
[ 3622.587310] hub 5-2:1.0: hub_resume
[ 3622.588566] usb 5-2-port2: status 0301 change 0001
[ 3622.695551] usb usb5-port2: resume, status 0
[ 3622.695573] hub 5-2:1.0: state 7 ports 4 chg 0004 evt 0000
[ 3622.696175] usb 5-2-port2: status 0301, change 0000, 1.5 Mb/s
[ 3622.696661] usb 5-2-port2: indicator auto status 0
[ 3622.773415] usb 5-2.2: new low-speed USB device number 8 using xhci_hcd

# connecting a third mouse to hub 1 has no effect

Regards,
Kuangyi
