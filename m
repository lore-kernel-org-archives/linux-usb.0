Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148D13911C7
	for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 13:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789477475; cv=pass; b=nSZskq/ZLjEBQgrt1nyBIMbk/pRuiz+1aelGCzePODt5/jxJatVdAL7NQ13UVHkY6p2xzNucA9fGK8pil29HX6PrJVsVSImDvIqLl+6apt+lY+/v15tX1tQWqatsDdzorSNdaAGdWril3FYdRumAJdOs1JXILuUrqbJxL++XAvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789477475; c=relaxed/simple;
	bh=pDpHJ7q1a2X7oew84p65Wb0V1E6lmyTzSVYGKtb/fAY=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J5Kd3b972nhvtdvlexXb9CKdt920XOu/J5DIov5MHypkm1GON4yaWcPw4l714Zvh54uObOtc3+AvDXEjOpn5xUgsmTjR75DiPXloO3lRtJ9gSPHTWZmJR0ugPJ/7g7nXTcRi1PgKJnWFJi0JO05mrUm+ekcMOYakR8kVK1GjC8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hGlNsBGg; arc=pass smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hGlNsBGg"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c8c0754so564615241.0
        for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 06:04:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789477473; cv=none;
        d=google.com; s=arc-20260327;
        b=QPDLCR5PhOXIvJGRrk78z7oN5h1JeTTxid4SvGCPF3c7vuUWHTWc/lenCnk8ub/gc9
         TeFeJE9ZaijD1P726PzdFJvHglI1n953vFrOa+9EdhKWtuXorpywHV+098s6rqBg+ok4
         5dt9qiWPnwkRiRrl6mMsxYYVibJUX8Fw8ihKxgSpHLGYSJ7T/NgIu1njWrJnjx+gnwfi
         g5iYOGBiks0Sem2GtjE/SzLJdbkjBPl0tOpnP6TcZtsG++1KwkssFgIJFstqs51Dhaq6
         GjSxZW5/C6ejPvNa5ng1Aeq/6k2ZV7dAsrsuyTfbtyI8v1tHrEAj/cTOHCNGGspxtVkJ
         XuEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=S53+YKgv9ossQwhtVWfKuizXo6fNejVhczXoysTOhbw=;
        fh=Mkp69qN5ADA4slW+EAEvfQI/ggj4rxigi/QC49UWQxc=;
        b=kc9x64062Pj/mHOmz8IDf2Abt7kCw8a+3jXZ4HbyKMUYrDzh1QuBChB70ZcTJ8WPkG
         3DgHQ5puW9oz+Luf+6vu5pT3bqOjqEnw/bZXBM+71YcZdSFsTtWCppX55S5nfUpspZY8
         gwmA0XiwqBHL3xqzYnh5qV4Cgx7pF4cWb2pkhCGAIr87ZrinesDW/Q65NehRRPdQ5+oI
         VSr3av+YqpzYAy1a2jR3Daf9T5GLSmRObGgsTIwBcLm8kYPjptzAfJGb5/2sreoVyW4y
         Hic8CWNhn7shI3rZ9CBtjP+BcuFXAtu/2eQabpNlyt9ryKAFLH8uCOfKpQxy2ZTM8RZ8
         QoYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789477473; x=1790082273; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=S53+YKgv9ossQwhtVWfKuizXo6fNejVhczXoysTOhbw=;
        b=hGlNsBGgpfpzt97xDJDcp1UnnsG3/AO1SweFiJguK7kSZtNcp7Haz/ML+9H79XhgsV
         lnFNaeHBDwILtkvDiBsVu2Pa9oKZlujrNjTKOExXguCg4DmuCm/T++z9IacOX8RYVEM+
         mU9fE4n//TUk+iOkWzM4Z9pqtuTec4Gpwv+03hHcRzLlqKyOIJqxU7gvpAJ6e7Ef3TXU
         93DyoEGGUdrlOEqDLg4rlYLAcz/pmzBSAlYxE29i1fTcw0b8cgGubAIDSK0OBYKDzffx
         7PfnlBL4YYXq7SrOQgkGGyCgrh/ECa1JuLa0P20yDNQ4zHDihNvxSVQJXaOPpYLl4Wzy
         vcYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789477473; x=1790082273;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S53+YKgv9ossQwhtVWfKuizXo6fNejVhczXoysTOhbw=;
        b=ZvPKsTqEJ5ge9p6pwpT7BrJ2yeBZXhw/rV451OPtL9Ax/ETbDhxZNapjmceOhUu+Q0
         /vZaP2gDpTooKfgyGsSjbepRtrI9aKF7VsEqXPYGye86dFBCekIM9AlCNCxTruUr6pHF
         OYB8H9DsYgpDzCz99hrItWjd01qV46rnp8jCSjpFzAkgM9ru+iUcbYHqoPyioV9rsSAq
         7b6NAsC1XvKKe4OOzHvIkHoNquIqVVn869AOt+yt+PeoHLXWjEF6OGpfpbKAl5GGh2vM
         OhoRF6i1kU0CeD67+KHPQDTZZxVDmzoxzQj8KYXa0maXwOLw9oSJM7iq9Dh/vRPaSPox
         arvQ==
X-Gm-Message-State: AFuF++lcrNmRPPdc+XyByKUY9amFWuEBXcOSn/Ic52aIPcdXpO0gI/rU
	YZU1jP9Fy9Ib06NrevJg8EOkVkFQ1lUgXP2uEQBlPDOBK3J7BpKoWacup6BhMhFyp4W6KQ3rGyv
	R2n/QbrLfUQHuFq3Cq0clv5y9jUYALibgbA==
X-Gm-Gg: AYBFou38jmPqBogEoEuaOb8WiZqCLTsPt9Fnma22Aoz5PVs2rPqUVfOdOxjJfX21LPD
	QEIk7pACB/HfBlD7b00DGkNGaQBox4dOXPg+yHwDFYCSqgsrJbloEiNuCIiBfz1CoOQeiQ1w7Qh
	vDKJjTWCbkj9bJ7AGo9E5SOH3ODR0iOPDfCBimdCKKKpv7vMeQQdxwaAKR3y3O4oe4Jt35J/RbW
	7qjC+C5j7RDb2Fsnu+ee2w/GzvSdFZeos7KMkB/jb+0bsx0iKnQrA8LLpn0Hf1+p+6nWCZ4VF87
	wjVfI80kL/cBcUdiD4y/W4Pc2k8Dw35ZsgXMTQzy18W2z2kmBwe4Oh5MQeyHr7M4cOg7R+ZDR77
	/25cOXuQIFUQ=
X-Received: by 2002:a05:6102:3708:b0:79e:df6b:d2b6 with SMTP id
 ada2fe7eead31-79edf7b4044mr355961137.2.1789477472670; Tue, 15 Sep 2026
 06:04:32 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 15 Sep 2026 09:04:31 -0400
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 15 Sep 2026 09:04:31 -0400
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CANJWS4yi_2X1h_V14V=kMOYL+pALacVF0U6byJJXVAsgpXPy1A@mail.gmail.com>
References: <CANJWS4yi_2X1h_V14V=kMOYL+pALacVF0U6byJJXVAsgpXPy1A@mail.gmail.com>
From: Ola Cewers <ola.cewers@gmail.com>
Date: Tue, 15 Sep 2026 09:04:31 -0400
X-Gm-Features: AcwNN1XFLNea6nmmYYEGClQFRP3vQ9QNe6LBpKoGD_ZBltfVTyZx4sC04M91S5k
Message-ID: <CANJWS4z3S_hOUhtJpg7WwC_Hknwc=9mDWOBDPoAnWNsj8cFNTQ@mail.gmail.com>
Subject: Re: ThinkPad X1 Carbon Gen 14: DP reconnect fails with Type-C ports
 registered; connector reset does not recover
To: linux-usb@vger.kernel.org
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Additional controlled comparison on 15 September 2026:

The same reconnect failure reproduces with Omarchy's linux-ptl kernel
7.2.3-arch1-1-ptl, in addition to Arch 7.2.3-arch1-3. These share the
Linux 7.2.3 base, so this is a variant comparison, not a test of a newer
upstream kernel. Dell U2722DE firmware remains M3T107.

With USB-C connected at boot, DP-1 was connected and displaying
2560x1440 at 59.951 Hz. However, this PTL boot already logged:
  UCSI_GET_PDOS failed (-70) [twice]
  possible UCSI driver bug 2
  error -EINVAL: PPM init failed
/sys/class/typec was empty even while the display worked.

After unplug/replug in the same boot:
- DRM DP-1 changed from connected to disconnected.
- The external monitor disappeared from Hyprland's monitor list.
- Monitor USB hubs and Realtek Ethernet re-enumerated; Ethernet carrier
  returned. AC/online remained 1.
- /sys/class/typec remained empty; no new UCSI messages were logged
  during the captured reconnect interval.

Boot-relative timestamps: USB disconnect at ~196.48 s, re-enumeration
starting at ~203.99 s, Ethernet carrier on at ~208.21 s.
No driver resets or configuration changes were made during this test.

This confirms that the installed PTL variant does not resolve the issue,
and that USB data/external power can return while the display connection
does not. It does not distinguish laptop firmware from a shared kernel
driver issue. The earlier stock-kernel boot with registered Type-C ports
and a failed reconnect remains a separate observation.

Full before/after kernel logs and connector state were saved locally
and can be provided if useful.

Firmware-side report:
https://github.com/fwupd/firmware-lenovo/issues/628

Thanks,
Ola Cewers
