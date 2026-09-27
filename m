Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FB6231842
	for <linux-usb@vger.kernel.org>; Sun, 27 Sep 2026 04:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790481630; cv=pass; b=ToD/x4/kLaUkIxiGNc1AEqYrZdPxiY6gq19oPUdzuh+h3zDoiKjAhukuY04IB/3Ep7cAOVftS34CLfrPEtlctW0sUJskXj7aiSszK/1Kie6/0lqtzNZtglfgJc6Q7glxr2q+aWsCxbQXSSl6gQwVMprHhx4+mxMsnUkvFnzPmzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790481630; c=relaxed/simple;
	bh=6VYfJ/iFF1s4RUDgb9ifvA9/YVQJniqLL6iBbH5T2DU=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hJAterP/SALP4v+aPReaXXeccf1IwtvYg7tPBj2Tz+GU9u6WUTK8OlSRzIor+aeCFOfOQ9cqHr9qZalkvEKvtfcmqI75txhvcUBkucuz1mYx2jVfDASQzmRtws7hYz67ujjbsfgBlQdEKYImL4EOtmQM50GNQjJmH7fhxWdC0j0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V3+HRKae; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V3+HRKae"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d43ac8d1eso16645697b3.2
        for <linux-usb@vger.kernel.org>; Sat, 26 Sep 2026 21:00:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790481628; cv=none;
        d=google.com; s=arc-20260327;
        b=GMGu6loAYURZwMKmSziXG1K1MeS1osMcvluoc5jx5TNkjvR3+hddEGAlo3Rz0ruk4w
         M9ZR1M5//20krY6sL/DtXwZyILb0LEyQUnOTC+HKuXWpRwkcnkPTnMNogcOcJFDT+Qex
         r7DaJS7lQ0waLLHULLSdCgkCmhPMyZRgknbV2o/ccXyr4O/HKopMz5dZoQ8CkbJxuOIM
         QG/iINd21/++TcEZ5GqFOJMsATMYkHwqsFJ1PfIv4yV9BCkHH9ybeL/v6gTscegk+1ZO
         LwSNMFzWnn9MUxLj9b3dmcmVNpIEJiFWnYzjWCyB4OQP/Nj2gmf403RwpW1jdk8Jnkei
         MmqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=xyNkhCgiiUIkRXYcRuY9lu1z6GloesYU3Yt8pS3/Dhc=;
        fh=AsywxLdjTCqAV9BN6UWbtz9qmUGScSEgUtGzVp2kIVo=;
        b=oX+BrYdQkD01w2UTv8ra15gUqgDlbI1eAkq+WUuS77xxAOMpFdlp11/6f4GPl0n6pg
         t3utfyKvhEhW5bU2++0aGJ1rkSDTd0qkAuCsEnhXTnadtQiHk7P8UKy5w7eWOe2Q0ni7
         i3j9xlKCV36shTcWyIeYn2ZUMdPAVKI8gbrQUqFFJ4EFuRNSYen/NkXvJkx54XDZSg2C
         L3++R/n9T6cuZgWyTKT63rNTxJZcVkCDExLmG+sfUPHIvm/6ADF5BBsYc1aRQ3kAJIZB
         19sOvTUykgzaut+2LB2MgfbIvB0Ap4Vqguy63WfahqsvWG3Ip2oOsN3bap1+MGEz6MFe
         YNgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790481628; x=1791086428; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xyNkhCgiiUIkRXYcRuY9lu1z6GloesYU3Yt8pS3/Dhc=;
        b=V3+HRKaeVgoyJVjL18rrG4QuEgRpBNRNN2k3IPBhIw6IfAF7nYQQVOuwHIQzqd40Tw
         hyQv3D9hCWUiCuuHmc9w11zL7b8bx9Bbso814xTLfja4AP2RrYaqb9P7ljZaEyQJ/PUY
         DlbT5dGQ9Uz/ZJF6CY6S19Qc8o37DYZpOKsxREwxbvkooy3HrcS9a7dl/27wsCKV9bXU
         sxybEz3rOvKzF01Hx1wI+cIocXEWY+QY0BmOVjcJtYsU4EItHAQnR8OI+BDDSAx6hkNJ
         AF/o4q/Fffrj2P+R3jAiYrqWD1hFEy/ZfCQQ0Q1CmVrmGiBlB3QCKMKXkw366q9NvA4P
         U7DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790481628; x=1791086428;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xyNkhCgiiUIkRXYcRuY9lu1z6GloesYU3Yt8pS3/Dhc=;
        b=Yhf9ItkPcntNN1BF3zfVVtHZlq7VxdFAkfmBD64spEuQWpnV6Z/EKHdbhJmVSZw7tE
         LI4P6R+4Vvep1LVckfE/bnqGBdTteeRQF2k133kLXrARqOqonquCMKKf+I0GYUCGbjYq
         PZccpqwFzqhFYD6GALFQCLrTO1yAE1peKJ9FELWrFct5CFGG+rtBMda6OPdto2kOzfET
         M2qx7xUWYVZHXgcZnG8cfQJpJYYsmhQRihQ+RgdWhRhD5ZqEdkdxUb9FXsh4Clp97wa1
         YyL+XLG/eCEyY221W/ow32/7y4Lycj9E6LiwTNMzaAaRj3/jND6WHUZpuV/b4uqVg719
         zKGg==
X-Forwarded-Encrypted: i=1; AKwUvBz1WhFfTF19oPO0OZkiIOh17CAsLjON+zP9zlJ1T0GGeuU/xYm/WOUbX+JiU39xdws/V/aw8r0vif8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqNg0YMUVBtdQWL4OkQZHPei9a7itQpNwga5Zn56SwyFXCUj3Z
	fue1fjcaIiRB4Crd2cBxyd2xne7QItaur8nEUODea4YEumMZ2jIU94vnssJ2NZEZ1RWntWLDUGe
	w3990HKuQQwzWRXfrrvS7DX/TNaRKSPQU6A==
X-Gm-Gg: AYBFou2r8ROc3TjMiyl/zZgv5SuojchL47/QUT6175hv2qpxzxzmmoNVaZqGVAZWv5E
	4XitEkgWI7dm24YeHhiwiF69X9/0VZmDQaRwJZGZzOdpNV2w/04spxHMvFzuKDMLVvAZPnz5c6C
	irpMXVrJNVdINFBcCCZFMTWA2ba0yNyxCpNPWpEWkRcW+JVu7oNO1CQ+v+b+E9APeRHrYnTDnQ3
	H7gvMztfswraJyFvRWU+4WJACsr9EZP3VTjfAlUFLA/cFx9xS9yS4Vk7VKpDMYTkMn0e1UszcaV
	h5l1zuPM7HUe/qHY00z8WgAGKCWy1qQmo7kKXMEU7nf/kqdGRbpHFtwfNTBGxfG78OkFmiiIyux
	IKTYNEin3hhH3ZeRsMCS7uPyXvBwU83G63iD+b5ivg8Sgw5Sx5A/uIY/B4rPs24ZSSOB4s5e79T
	PxwGrqMmyWwiic45Nx6SI=
X-Received: by 2002:a05:690c:6d82:b0:873:5c0f:28c with SMTP id
 00721157ae682-8a64be54149mr54815777b3.54.1790481627796; Sat, 26 Sep 2026
 21:00:27 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 26 Sep 2026 21:00:25 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 26 Sep 2026 21:00:25 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <96eedd54-7d2d-49a8-97a4-44342460c9fc@linuxfoundation.org>
References: <CA+Z0x2JTGOsnu7gNPWBfxCZD0vesbezJ7-yhT1sOOuUdmdcQRQ@mail.gmail.com>
 <CA+Z0x2+wLqeT84WGYsWQ1bPu1mz_A72_Ka3vv9u6RHdtQvc_Xg@mail.gmail.com> <96eedd54-7d2d-49a8-97a4-44342460c9fc@linuxfoundation.org>
From: Jason Colapietro <jasoncola1@gmail.com>
Date: Sat, 26 Sep 2026 21:00:25 -0700
X-Gm-Features: AclHuK-qq7ZroknohQuLiTUxmgTMYcUwu4Pqb5flHoGK3deX0Cb6IkP0dtbLjic
Message-ID: <CA+Z0x2KoEghFkYKmXckq3ezLo5bvgHJ7yG=JqjHu6Ga3t1wuew@mail.gmail.com>
Subject: Re: [PATCH v7] usbip: make remote list honor parsable output
To: Shuah Khan <skhan@linuxfoundation.org>, shuah@kernel.org, 
	valentina.manea.m@gmail.com
Cc: greg@kroah.com, i@zenithal.me, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Shuah and all,

The exact v7 patch has now been built and tested with a native Linux
USB/IP stack.

Test setup: Alpine Linux 3.23.4 on aarch64, kernel 6.18.53-0-lts,
usbip-utils 2.0. A QEMU USB mass-storage device (46f4:0001, busid 2-1)
was bound to usbip-host and exported by usbipd. The client connected
to 127.0.0.1:3240.

With the unpatched client, "usbip list -p -r 127.0.0.1" still printed
the human-readable "Exportable USB devices" report, reproducing the
bug. With the v7 client, the same command returned:

    busid=2-1#usbid=46f4:0001#

"usbip list -r 127.0.0.1" retained its human-readable output,
including the device path and interface details. After unbinding the
device, the parsable command exited successfully with zero bytes on
stdout; rebinding restored the record.

I also attached busid 2-1 through the v7 client. "usbip port" showed
it imported through vhci_hcd at port 08, and lsusb showed the device
on both the original and virtual host buses. Detach succeeded, leaving
no imported port. The build, list, attach, and detach commands all
exited successfully.

This was one Linux VM with an emulated USB device and TCP loopback. I
have not tested physical USB hardware or two separate machines. The
existing option-order behavior is unchanged: -p must precede -r.

Thanks,
Jason

On Wed, 23 Sep 2026 02:44:58 -0600, Shuah Khan
<skhan@linuxfoundation.org> wrote:
> On 9/14/26 11:43, Jason Colapietro wrote:
> > Hi all,
> >
> > Friendly ping on v7, sent September 7. The code remains identical to
> > v6; v7 only corrected the Assisted-by trailer format. Please let me
> > know if any further changes or native Linux/USB-IP testing would help
> > move this forward.
> >
>
> Sorry. It is important to test end to end on a Linux machine to verify
> patches. I can't accept patches that aren't tested on macOS - it just
> doesn't make sense to do so.
>
> thanks,
> -- Shuah
