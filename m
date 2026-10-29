Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793252708;
	b=F+TiQe8mu1Fkw9naHTm6IoBhwsyaRMOqF/tfo59Itjy8xCSgrvvuz4SAW8J3mxQPLN5d
	 BeScGho4n30Q5MAR4RMFrfiMgfI8LSyIODZi4CM13gHAwWwsDAhEX/XF3Af6byKrMsnaW
	 Co7tydyVXCSrjfOEj9JGFcmVOyLlf7dm8AsJU05ymbD8VWc/uTHWiT10I3sUCn8svdak/
	 zgGtZQXu+rfPpASnnRHynCAMwNfqYDN42CikLvebbJf9f2z+ulp+fiFcnU9qxXhW7DeiL
	 oLE3E56sLI9RHnScGINFVcATDfVCI2VJx+WnMrSxN/9FHtTytTzGe3N9zKIcNU8j38w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252708;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=qBJNInQsDqS/eXQK1H9fsJMzihzWSibOqiepvPT7upM=;
	b=KwVnwNodGLXIR9FAmZ3K4qVxX9H0JZFHs8Y7jTsEbuaQz4XNWZC17y5pNGIFHMw5Wpr6
	 +Yga5FnDQYyC/Bo6/aKTgpeOqK9YEsypqXO7aWrgkPXmGYXgTuD4F4Tnmjv+O5dOl+lGl
	 iwypzAKg4jecFgSYAWqDNxMJoPJVMlHU5Jo9HqRPjK3DVO0xH/2sY6UD7ZiEzhgpoxLue
	 Nmx/hcYTM2u5not6Z+Y3jv5yBnY3I20Y6y/0/55YxtXQEt+3SkM589V7b6Z++lxcxnUSx
	 W4g02Hz8KlbRP8svDoft2814ES3UrndP4cA5edF+SC2D7UGKEfq+pHtR52puXTfo3iw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xhpE5eKG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E51606A31A
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 05:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87E51606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xhpE5eKG
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93cbc3ab2fdso83550785a.3
        for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 22:45:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793252707; cv=none;
        d=google.com; s=arc-20260327;
        b=KaNpUaSgBrnkENZgV1grUbh1ZUY/9NOtl+M3OaSdmkgksaA34o9LLjqd4U7k0g8Q/Y
         RVJpHtsiRviZ+D75qR4902pIRHslMoKYrb5Vg6ZlDdFnBf/hjPy6xc7WyOLh2xMcJ6ar
         4DohrVxddzMz1zEi9kCbAPfTJXVy1yljMxXYWv+Bw4c0YhnEfHEMZ+SK/gdvuiMarWZC
         e6pdIVfBttspHBjNgAKMajViJi/ryus2gJRyPPEJEbE57FsviKIZF7Ko3GM7CkpW4AWm
         LClJuRh0pD/hWT2ETK/fQ2lmCDOOyqNEdga9YmgSGlP7Y1oo231XXBZ+yxphsO6XSLK9
         D29Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=qBJNInQsDqS/eXQK1H9fsJMzihzWSibOqiepvPT7upM=;
        fh=9vz1pE443kod7haTGl5EyCwq81wX2oEA3cL3HLZZbrc=;
        b=mFuG9SmDCMm1oCvQ6RYJN2jXQVZ6mAlsH0Xb34IBF5Cis2EPqzQIdQCfyApHloYguo
         AgIDjtuDRUvwYCjJX00tF9X1ekanRxlkb0vMNSuFhdUYVfwWzD7VCRBwEH+Q1wUejZIB
         2Z+hlCElf43qSDMxU1OZgHjeJ/OcQd9+S3TjGwVuQMNNN33VqsVkv9iph8Xjrq7Kdyex
         6BsrFIaOMP4axUN3F7okqNzqo6WC1jtN95vwukgU3zuX0pVMSkslXEsbVf2Q63A5LC05
         yhntnYRNlw1mt9btdOSCZ1/V5Z3yetOJ+cJiIC4QQps/2fpduOWLxen3JZ4WopmZzKhF
         Jh4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793252707; x=1793857507; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qBJNInQsDqS/eXQK1H9fsJMzihzWSibOqiepvPT7upM=;
        b=xhpE5eKG62u7Zr9d9GqdHkT+7xNtp07S45H3jgpotFj90ucpDtjAGH48nKFrngJkwj
         AD6t9g2L0o3eRaNoP5YfNVvPh25KcKMclfbREjsk1/wviGCrUi1fm9gM/Kh35BDyDqA4
         9QPagBcfoMOl7dN/XmUv7xQrY09Xbq4iXBGby/1coPiKYpfBlwPzq39SmtXVPxIQoAu7
         3zGx8nWhF2//Yyr1QftRvVAN9Su+W5L/3ZBHHOlnvWh+jxEQWqTlnKOwc9U7rA99vLVK
         RoNmz7Jn86l6QDNyJ7R4REx64G6yZJ7r9Xe6r4BVGw+uCGwN4JKDrVrKN72hjKS55IY8
         1FyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252707; x=1793857507;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qBJNInQsDqS/eXQK1H9fsJMzihzWSibOqiepvPT7upM=;
        b=KK7+JJF4yvHvBAvOuViasOgos/Lj47c688Tn8j8ez1RGskx1IEsApPAIfkLfsgVom6
         rt4IHcTPad1NRAFDagjZx4jagxYC6EnsySGVS6868Vc9lNgsPpDdNMgkkyKLBJsBpYFa
         yc+wGXlIsmGV3jduMSynjnCWscDgyp5J8+7Lj1EffvHMCGsk3/TsokuhfpUGYD/9HSk4
         lbzse89SNWKvjmC9O4K3zggUGwP2IkZJ9cA8uVveGEaaFRERRl7oO77RdlNs2Y4Pq0G2
         bQ+B3x7thulp+r2tjIXihiT7za6UO6F0f6Qrm4+1OgaVccHDkMDWqjqQkdcu7MZwOxwA
         yQng==
X-Forwarded-Encrypted: i=1; AKwUvBwK3xRIDyBKN6WmtqdAbWETMp7d3L5FnYcH0BRtA75HJO79V3AoD1BGSM3yyIDEMLWy2U3aJB0EcUw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQ6Ds9cydoZp1d/4BxkbVF85CkgXwpBxtsWLAP4n+9HE8rx5aC
	vHPZ5F74hkzBTkkD50wfOrPKd4hmzzjfSNYi3QULf7bYAq7eSyZMDDqaBymDZ8wLhNear4CWDCz
	/QN3ngqwwo1QGA1K0Vs885JwSvlixl6k=
X-Gm-Gg: AYBFou3jlxuRFDbu6QdXYzl/lgHXAXyW4l7LgLeXcBYSw+6wRMX8Z8+IlIWwki+8H7q
	kyIQOr4iP5msmZrJLHLu6HhEXdaPq1Q1eZiSXmVsi9rxU8b6GtUUdjueeGlCg3knyn+hN0/p6/R
	+5IqCOgNH2OnxvTkGItS3cWwXvUj1rP8AFMoehmBYTvJeLFoLG0T1KgR7zC0U207QtBznPN/OGj
	aMuw2zhYssbTh4+WOyzT8jk0IZPpLSwDyUYp81gzdENzZJBX1BcXfksHc6+e15XwbUOKnUtWnM2
	WW6LWGqHin58cZYx3XRGuWrJCqkiBfDVz3r58NTs6ZWjpVSVuPIjehalgAb3OwMBze9GdXpeZIT
	l+lZIn8kc4uMwVEendIZvtgTCOQv2iqsmmPk=
X-Received: by 2002:a05:620a:1b9a:b0:93f:a63:15f8 with SMTP id
 af79cd13be357-94408939671mr634156585a.8.1793252707463; Wed, 28 Oct 2026
 22:45:07 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 28 Oct 2026 22:45:07 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 28 Oct 2026 22:45:06 -0700
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Basilisk <basilisk.bat.lol@gmail.com>
Date: Wed, 28 Oct 2026 22:45:06 -0700
X-Gm-Features: AclHuK8K_sAoRdtNOdKpNS4uSgTijidndG3K0-6_heD5RERXoNFooyKms7WY_l0
Message-ID: <CAA-r21oVYLu6atoQPGdLsucggdQ+oi-HRS1HYeJkThx6WZX1qg@mail.gmail.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-out-of-bounds Read in dummy_free_request
To: syzbot+67d9d15423ddc0f15859@syzkaller.appspotmail.com, 
	linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org, syzkaller-bugs@googlegroups.com
Content-Type: multipart/mixed; boundary="0000000000009f177b065ef42ee4"

--0000000000009f177b065ef42ee4
Content-Type: text/plain; charset="UTF-8"

Hello,

I recovered a standalone C reproducer for this syzbot report:
https://syzkaller.appspot.com/bug?extid=67d9d15423ddc0f15859

Tested kernel: Linux commit 818bebeb63dd6bf5f4e07e145f6cdbace520a34c,
with KASAN enabled. The test image and kernel config came from the
organizer-issued VM bundle; the config SHA-256
(931eaba43a7eb088afed08418c1eb5bb1894ce6316ec9d91cccdc8759e222c83)
matches the public config linked by syzbot. I used a private copy of
the boot script with guest RAM changed from 2 GiB to 1 GiB; the kernel
image, initramfs, and config were unchanged.

On two fresh boots, the attached repro.c produced a KASAN
slab-out-of-bounds Read of size 8 in dummy_free_request() at
drivers/usb/gadget/udc/dummy_hcd.c:710. The UVC bind logged "Unable to
allocate streaming EP" immediately before the report. The call trace
included dummy_free_request, uvc_function_bind, usb_add_function, and
configfs_composite_bind. The organizer's independent grader also
returned "confirmed" and "reproduced: true" for the same fault family
and function.

To run: compile the attached file with `cc -O2 -Wall -o repro
repro.c`, then run `./repro` as root in an isolated VM with configfs,
usbip-vudc, and dummy_hcd available. It creates a UVC configfs gadget,
binds it to usbip-vudc, unbinds without removing the UVC function,
then attempts to bind the same gadget to dummy_hcd. Inspect the kernel
console after the second bind.

Source inspection suggests that UVC retains a control_req pointer
after the first unbind frees it. The second bind fails to allocate a
streaming endpoint and passes that stale pointer to dummy_hcd's
free_request callback, which reads it using the dummy_request layout.
I have not tested a fix.

The attached file is the same tested code with only its header
comments and one error message updated for this report. Its SHA-256 is
642B0D2C76957105A2BC671F3F562FF2110B09CB61CA7F47D3AD35ECC4ED07F2.

Basilisk
Random Player Killer

--0000000000009f177b065ef42ee4
Content-Type: text/plain; charset="UTF-8"; name="repro.c"
Content-Disposition: attachment; filename="repro.c"
Content-Transfer-Encoding: base64
X-Attachment-Id: bd973b950615e8c1_0.1

I2RlZmluZSBfR05VX1NPVVJDRQojaW5jbHVkZSA8ZGlyZW50Lmg+CiNpbmNsdWRlIDxlcnJuby5o
PgojaW5jbHVkZSA8ZmNudGwuaD4KI2luY2x1ZGUgPGxpbWl0cy5oPgojaW5jbHVkZSA8c3RkYXJn
Lmg+CiNpbmNsdWRlIDxzdGRpby5oPgojaW5jbHVkZSA8c3RkbGliLmg+CiNpbmNsdWRlIDxzdHJp
bmcuaD4KI2luY2x1ZGUgPHN5cy9tb3VudC5oPgojaW5jbHVkZSA8c3lzL3N0YXQuaD4KI2luY2x1
ZGUgPHN5cy90eXBlcy5oPgojaW5jbHVkZSA8dW5pc3RkLmg+CgovKgogKiBSZXByb2R1Y2VyIGZv
ciBMaW51eCA4MThiZWJlYjYzZGQ2YmY1ZjRlMDdlMTQ1ZjZjZGJhY2U1MjBhMzRjLgogKiBSZXBy
b2R1Y2VkIG9uIHR3byBmcmVzaCBWTSBib290cyB3aXRoIHRoZSBzYW1lIEtBU0FOIHJlcG9ydC4K
ICogTXVzdCBydW4gYXMgcm9vdCBpbiBhbiBpc29sYXRlZCB0ZXN0IFZNLgogKi8KCnN0YXRpYyB2
b2lkIGZhaWwoY29uc3QgY2hhciAqd2hhdCwgY29uc3QgY2hhciAqcGF0aCkKewogICAgZnByaW50
ZihzdGRlcnIsICJGQUlMICVzICVzOiAlc1xuIiwgd2hhdCwgcGF0aCwgc3RyZXJyb3IoZXJybm8p
KTsKICAgIGV4aXQoMSk7Cn0KCnN0YXRpYyB2b2lkIG1ha2VfcGF0aChjaGFyIG91dFtQQVRIX01B
WF0sIGNvbnN0IGNoYXIgKmZtdCwgLi4uKQp7CiAgICB2YV9saXN0IGFwOwogICAgaW50IG47CiAg
ICB2YV9zdGFydChhcCwgZm10KTsKICAgIG4gPSB2c25wcmludGYob3V0LCBQQVRIX01BWCwgZm10
LCBhcCk7CiAgICB2YV9lbmQoYXApOwogICAgaWYgKG4gPCAwIHx8IG4gPj0gUEFUSF9NQVgpIHsK
ICAgICAgICBmcHV0cygiRkFJTCBwYXRoIHRvbyBsb25nXG4iLCBzdGRlcnIpOwogICAgICAgIGV4
aXQoMSk7CiAgICB9Cn0KCnN0YXRpYyB2b2lkIG1rKGNvbnN0IGNoYXIgKnBhdGgpCnsKICAgIGlm
IChta2RpcihwYXRoLCAwNzU1KSAmJiBlcnJubyAhPSBFRVhJU1QpCiAgICAgICAgZmFpbCgibWtk
aXIiLCBwYXRoKTsKfQoKc3RhdGljIHZvaWQgd3IoY29uc3QgY2hhciAqcGF0aCwgY29uc3QgY2hh
ciAqdmFsdWUpCnsKICAgIHNpemVfdCBsZW4gPSBzdHJsZW4odmFsdWUpOwogICAgaW50IGZkID0g
b3BlbihwYXRoLCBPX1dST05MWSB8IE9fQ0xPRVhFQyk7CiAgICBpZiAoZmQgPCAwKQogICAgICAg
IGZhaWwoIm9wZW4iLCBwYXRoKTsKICAgIGlmICh3cml0ZShmZCwgdmFsdWUsIGxlbikgIT0gKHNz
aXplX3QpbGVuKSB7CiAgICAgICAgaW50IHNhdmVkID0gZXJybm87CiAgICAgICAgY2xvc2UoZmQp
OwogICAgICAgIGVycm5vID0gc2F2ZWQgPyBzYXZlZCA6IEVJTzsKICAgICAgICBmYWlsKCJ3cml0
ZSIsIHBhdGgpOwogICAgfQogICAgaWYgKGNsb3NlKGZkKSkKICAgICAgICBmYWlsKCJjbG9zZSIs
IHBhdGgpOwp9CgpzdGF0aWMgaW50IGJpbmRfdWRjKGNvbnN0IGNoYXIgKnBhdGgsIGNvbnN0IGNo
YXIgKm5hbWUpCnsKICAgIGNoYXIgdmFsdWVbMjU2XTsKICAgIGludCBmZCwgc2F2ZWQ7CiAgICBz
aXplX3QgbGVuOwogICAgaW50IG4gPSBzbnByaW50Zih2YWx1ZSwgc2l6ZW9mKHZhbHVlKSwgIiVz
XG4iLCBuYW1lKTsKICAgIGlmIChuIDwgMCB8fCBuID49IChpbnQpc2l6ZW9mKHZhbHVlKSkgewog
ICAgICAgIGVycm5vID0gRU5BTUVUT09MT05HOwogICAgICAgIHJldHVybiAtMTsKICAgIH0KICAg
IGxlbiA9IChzaXplX3QpbjsKICAgIGZkID0gb3BlbihwYXRoLCBPX1dST05MWSB8IE9fQ0xPRVhF
Qyk7CiAgICBpZiAoZmQgPCAwKQogICAgICAgIHJldHVybiAtMTsKICAgIGlmICh3cml0ZShmZCwg
dmFsdWUsIGxlbikgIT0gKHNzaXplX3QpbGVuKSB7CiAgICAgICAgc2F2ZWQgPSBlcnJubyA/IGVy
cm5vIDogRUlPOwogICAgICAgIGNsb3NlKGZkKTsKICAgICAgICBlcnJubyA9IHNhdmVkOwogICAg
ICAgIHJldHVybiAtMTsKICAgIH0KICAgIGlmIChjbG9zZShmZCkpCiAgICAgICAgcmV0dXJuIC0x
OwogICAgcmV0dXJuIDA7Cn0KCnN0YXRpYyB2b2lkIGxuKGNvbnN0IGNoYXIgKnRhcmdldCwgY29u
c3QgY2hhciAqbGlua25hbWUpCnsKICAgIGlmIChzeW1saW5rKHRhcmdldCwgbGlua25hbWUpKQog
ICAgICAgIGZhaWwoInN5bWxpbmsiLCBsaW5rbmFtZSk7Cn0KCnN0YXRpYyB2b2lkIGZpbmRfdWRj
cyhjaGFyIHZ1ZGNbMjU2XSwgY2hhciBkdW1teVsyNTZdKQp7CiAgICBzdHJ1Y3QgZGlyZW50ICpl
bnRyeTsKICAgIERJUiAqZGlyID0gb3BlbmRpcigiL3N5cy9jbGFzcy91ZGMiKTsKICAgIGlmICgh
ZGlyKQogICAgICAgIGZhaWwoIm9wZW5kaXIiLCAiL3N5cy9jbGFzcy91ZGMiKTsKICAgIHZ1ZGNb
MF0gPSBkdW1teVswXSA9ICdcMCc7CiAgICB3aGlsZSAoKGVudHJ5ID0gcmVhZGRpcihkaXIpKSAh
PSBOVUxMKSB7CiAgICAgICAgaWYgKHN0cnN0cihlbnRyeS0+ZF9uYW1lLCAidXNiaXAtdnVkYyIp
ICYmICF2dWRjWzBdKQogICAgICAgICAgICBzbnByaW50Zih2dWRjLCAyNTYsICIlcyIsIGVudHJ5
LT5kX25hbWUpOwogICAgICAgIGlmIChzdHJzdHIoZW50cnktPmRfbmFtZSwgImR1bW15X3VkYyIp
ICYmICFkdW1teVswXSkKICAgICAgICAgICAgc25wcmludGYoZHVtbXksIDI1NiwgIiVzIiwgZW50
cnktPmRfbmFtZSk7CiAgICB9CiAgICBjbG9zZWRpcihkaXIpOwogICAgaWYgKCF2dWRjWzBdIHx8
ICFkdW1teVswXSkgewogICAgICAgIGZwcmludGYoc3RkZXJyLCAiRkFJTCBVREMgZGlzY292ZXJ5
OiB2dWRjPSVzIGR1bW15PSVzXG4iLAogICAgICAgICAgICAgICAgdnVkY1swXSA/IHZ1ZGMgOiAi
bWlzc2luZyIsIGR1bW15WzBdID8gZHVtbXkgOiAibWlzc2luZyIpOwogICAgICAgIGV4aXQoMik7
CiAgICB9CiAgICBmcHJpbnRmKHN0ZGVyciwgIlVEQ3M6IGZpcnN0PSVzIHNlY29uZD0lc1xuIiwg
dnVkYywgZHVtbXkpOwp9CgppbnQgbWFpbih2b2lkKQp7CiAgICBjaGFyIHZ1ZGNbMjU2XSwgZHVt
bXlbMjU2XSwgZ1tQQVRIX01BWF0sIGZbUEFUSF9NQVhdLCBwW1BBVEhfTUFYXTsKICAgIGNoYXIg
dGFyZ2V0W1BBVEhfTUFYXSwgbGlua25hbWVbUEFUSF9NQVhdLCB1ZGNfcGF0aFtQQVRIX01BWF07
CgogICAgc2V0dmJ1ZihzdGRlcnIsIE5VTEwsIF9JT05CRiwgMCk7CiAgICBpZiAoZ2V0ZXVpZCgp
KSB7CiAgICAgICAgZnB1dHMoIkZBSUwgcmVxdWlyZXMgcm9vdCBpbiB0ZXN0IFZNXG4iLCBzdGRl
cnIpOwogICAgICAgIHJldHVybiAyOwogICAgfQogICAgbWsoIi9zeXMiKTsKICAgIGlmIChhY2Nl
c3MoIi9zeXMvY2xhc3MvdWRjIiwgRl9PSykgJiYKICAgICAgICBtb3VudCgic3lzZnMiLCAiL3N5
cyIsICJzeXNmcyIsIDAsIE5VTEwpICYmIGVycm5vICE9IEVCVVNZKQogICAgICAgIGZhaWwoIm1v
dW50IiwgIi9zeXMiKTsKICAgIG1rKCIvc3lzL2tlcm5lbC9jb25maWciKTsKICAgIGlmIChhY2Nl
c3MoIi9zeXMva2VybmVsL2NvbmZpZy91c2JfZ2FkZ2V0IiwgRl9PSykgJiYKICAgICAgICBtb3Vu
dCgibm9uZSIsICIvc3lzL2tlcm5lbC9jb25maWciLCAiY29uZmlnZnMiLCAwLCBOVUxMKSAmJiBl
cnJubyAhPSBFQlVTWSkKICAgICAgICBmYWlsKCJtb3VudCIsICIvc3lzL2tlcm5lbC9jb25maWci
KTsKICAgIGZpbmRfdWRjcyh2dWRjLCBkdW1teSk7CgogICAgbWFrZV9wYXRoKGcsICIvc3lzL2tl
cm5lbC9jb25maWcvdXNiX2dhZGdldC9ycGtfdXNiXyVsZCIsIChsb25nKWdldHBpZCgpKTsKICAg
IG1rKGcpOwogICAgbWFrZV9wYXRoKHAsICIlcy9pZFZlbmRvciIsIGcpOyB3cihwLCAiMHgxZDZi
XG4iKTsKICAgIG1ha2VfcGF0aChwLCAiJXMvaWRQcm9kdWN0IiwgZyk7IHdyKHAsICIweDAxMDRc
biIpOwogICAgbWFrZV9wYXRoKHAsICIlcy9iY2RVU0IiLCBnKTsgd3IocCwgIjB4MDIwMFxuIik7
CiAgICBtYWtlX3BhdGgocCwgIiVzL2NvbmZpZ3MvYy4xIiwgZyk7IG1rKHApOwogICAgbWFrZV9w
YXRoKHAsICIlcy9jb25maWdzL2MuMS9NYXhQb3dlciIsIGcpOyB3cihwLCAiMTIwXG4iKTsKICAg
IG1ha2VfcGF0aChmLCAiJXMvZnVuY3Rpb25zL3V2Yy4wIiwgZyk7IG1rKGYpOwoKICAgIC8qIEEg
ZG9jdW1lbnRlZCBtaW5pbWFsIE1KUEVHIGZvcm1hdC9mcmFtZSBhbmQgdGhlIFVWQyBoZWFkZXIg
bGlua3MuICovCiAgICBtYWtlX3BhdGgocCwgIiVzL3N0cmVhbWluZy9tanBlZy9tIiwgZik7IG1r
KHApOwogICAgbWFrZV9wYXRoKHAsICIlcy9zdHJlYW1pbmcvbWpwZWcvbS8zNjBwIiwgZik7IG1r
KHApOwogICAgbWFrZV9wYXRoKHAsICIlcy9zdHJlYW1pbmcvbWpwZWcvbS8zNjBwL3dXaWR0aCIs
IGYpOyB3cihwLCAiNjQwXG4iKTsKICAgIG1ha2VfcGF0aChwLCAiJXMvc3RyZWFtaW5nL21qcGVn
L20vMzYwcC93SGVpZ2h0IiwgZik7IHdyKHAsICIzNjBcbiIpOwogICAgbWFrZV9wYXRoKHAsICIl
cy9zdHJlYW1pbmcvbWpwZWcvbS8zNjBwL2R3TWF4VmlkZW9GcmFtZUJ1ZmZlclNpemUiLCBmKTsg
d3IocCwgIjQ2MDgwMFxuIik7CiAgICBtYWtlX3BhdGgocCwgIiVzL3N0cmVhbWluZy9tanBlZy9t
LzM2MHAvZHdGcmFtZUludGVydmFsIiwgZik7IHdyKHAsICIzMzMzMzNcbiIpOwogICAgbWFrZV9w
YXRoKHAsICIlcy9zdHJlYW1pbmcvaGVhZGVyL2giLCBmKTsgbWsocCk7CiAgICBtYWtlX3BhdGgo
dGFyZ2V0LCAiJXMvc3RyZWFtaW5nL21qcGVnL20iLCBmKTsKICAgIG1ha2VfcGF0aChsaW5rbmFt
ZSwgIiVzL3N0cmVhbWluZy9oZWFkZXIvaC9tIiwgZik7IGxuKHRhcmdldCwgbGlua25hbWUpOwog
ICAgbWFrZV9wYXRoKHRhcmdldCwgIiVzL3N0cmVhbWluZy9oZWFkZXIvaCIsIGYpOwogICAgbWFr
ZV9wYXRoKGxpbmtuYW1lLCAiJXMvc3RyZWFtaW5nL2NsYXNzL2ZzL2giLCBmKTsgbG4odGFyZ2V0
LCBsaW5rbmFtZSk7CiAgICBtYWtlX3BhdGgobGlua25hbWUsICIlcy9zdHJlYW1pbmcvY2xhc3Mv
aHMvaCIsIGYpOyBsbih0YXJnZXQsIGxpbmtuYW1lKTsKICAgIG1ha2VfcGF0aChsaW5rbmFtZSwg
IiVzL3N0cmVhbWluZy9jbGFzcy9zcy9oIiwgZik7IGxuKHRhcmdldCwgbGlua25hbWUpOwogICAg
bWFrZV9wYXRoKHAsICIlcy9jb250cm9sL2hlYWRlci9oIiwgZik7IG1rKHApOwogICAgbWFrZV9w
YXRoKHRhcmdldCwgIiVzL2NvbnRyb2wvaGVhZGVyL2giLCBmKTsKICAgIG1ha2VfcGF0aChsaW5r
bmFtZSwgIiVzL2NvbnRyb2wvY2xhc3MvZnMvaCIsIGYpOyBsbih0YXJnZXQsIGxpbmtuYW1lKTsK
ICAgIG1ha2VfcGF0aChsaW5rbmFtZSwgIiVzL2NvbnRyb2wvY2xhc3Mvc3MvaCIsIGYpOyBsbih0
YXJnZXQsIGxpbmtuYW1lKTsKICAgIG1ha2VfcGF0aChsaW5rbmFtZSwgIiVzL2NvbmZpZ3MvYy4x
L3V2Yy4wIiwgZyk7IGxuKGYsIGxpbmtuYW1lKTsKCiAgICBtYWtlX3BhdGgodWRjX3BhdGgsICIl
cy9VREMiLCBnKTsKICAgIGZwcmludGYoc3RkZXJyLCAiQmluZGluZyBVVkMgdG8gSVNPLWNhcGFi
bGUgJXNcbiIsIHZ1ZGMpOwogICAgaWYgKGJpbmRfdWRjKHVkY19wYXRoLCB2dWRjKSkKICAgICAg
ICBmYWlsKCJmaXJzdCBVREMgYmluZCIsIHVkY19wYXRoKTsKICAgIGZwdXRzKCJGaXJzdCBiaW5k
IHN1Y2NlZWRlZDsgdW5iaW5kaW5nIHdpdGhvdXQgdW5saW5raW5nIFVWQyBmdW5jdGlvblxuIiwg
c3RkZXJyKTsKICAgIGlmIChiaW5kX3VkYyh1ZGNfcGF0aCwgIiIpKQogICAgICAgIGZhaWwoIlVE
QyB1bmJpbmQiLCB1ZGNfcGF0aCk7CgogICAgLyogVGhlIHNhbWUgdXNiX2Z1bmN0aW9uIHN1cnZp
dmVzLiBkdW1teV9oY2QgaGFzIG5vIElTTyBzdHJlYW1pbmcgRVAuICovCiAgICBmcHJpbnRmKHN0
ZGVyciwgIkJpbmRpbmcgc2FtZSBVVkMgZnVuY3Rpb24gdG8gJXM7IGV4cGVjdCBVVkMgYmluZCBl
cnJvciBhbmQgS0FTQU5cbiIsIGR1bW15KTsKICAgIGlmIChiaW5kX3VkYyh1ZGNfcGF0aCwgZHVt
bXkpKQogICAgICAgIGZwcmludGYoc3RkZXJyLCAiU2Vjb25kIGJpbmQgcmV0dXJuZWQgZXJybm89
JWQgKCVzKTsgaW5zcGVjdCBrZXJuZWwgY29uc29sZSBmb3IgS0FTQU5cbiIsCiAgICAgICAgICAg
ICAgICBlcnJubywgc3RyZXJyb3IoZXJybm8pKTsKICAgIGVsc2UKICAgICAgICBmcHV0cygiU2Vj
b25kIGJpbmQgdW5leHBlY3RlZGx5IHN1Y2NlZWRlZDsgaW5zcGVjdCBrZXJuZWwgY29uc29sZVxu
Iiwgc3RkZXJyKTsKICAgIHJldHVybiAwOwp9DQo=
--0000000000009f177b065ef42ee4--
