Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792503707;
	b=TI8mcVqZdBGD75R015/Zy/UpLXIx/CMlE6+NVfZijCCB9IluexAPbC0oGswb9Wl332tG
	 p7LOR3tLTm/KZcwRNx6TPZnmnQ/Y5N9NvbEGa4sk3yuwFNOEbkbgOe2g1bYSrMmJlwgvX
	 rcTtbNxK2LufYPXZ+PJDBAbSFy7dbEE7MfLiSSGk1IAVr76mkSIl9+tvGYYZGG6U2i3Xk
	 O1zQ1eND5cVkIiYNdK1kks8LpJMZsx4A0UbfKTuPyt+1Ky4j3lDxk+XvI2VDSQVJFyhJe
	 hRY+RaBVI5pOejDg9h33rkp5qidLvPEmG87iskf6ZLOE0tx87ZoVYNutksojSwV19PA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503707;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/RVubQRlFmyh4sBKG2wLnYUF9xxu+g6QqTha8IWoqtI=;
	b=2svWH+DxjULlh8ytzPgn3RL77cyhPT71v4WlOVq4pvJtlkcDbM3Q4teNqaE11wqDONqB
	 aEAz6zR5/G7DMSrqa0k64JOErT+pDLUmIY0NGBZBx2EW/CyndoFfaOgWpafabIWar/A9i
	 xvjhfkIlYdZA9+9gB1LoiRAlz6+e2Vx3Pq/3hiOlK2b+iNT6ULlQqW3ANkjuUyzWJEoJV
	 bCfg1qr+eMh45A8JkxpQ717e9M1X98biMOStegGWwbbpfUG7LoTs4FqkYFn0xNQQp3Ijy
	 AUHQIPAFihF70OruIvg+A/IhrtSLl5pA6LvHRhnRenfsix31A1mqBBOkfoZJGJFAbcA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HoNoMbZv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BF1606A31A
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 13:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0BF1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HoNoMbZv
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6acbe0e4090so475187a12.1
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 06:41:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792503705; cv=none;
        d=google.com; s=arc-20260327;
        b=KScZLSIElIKDaK+wNVp68hpmArDM1vP8QBIfcnX9vTFZIIjsF9M5TnMP2KVwdlMI8F
         kmQMar4LnK//r+B9w5vRm0syQm6OUDNmdVM4s7kpZM6PrAmxsRd5xWPH9SRJoUApacXW
         uoeHA+q6xy1wpQ7rnOtabX/hhFH7AuF6L7HjGH+6g5GFCem8mLRW07PkCjcAfJd4WyPw
         zRwpcq5b4/bAw/OUDhHZ+5fX3K7FZorcx2Ep1aPntWHOvZHgRP/7C7vlscMPIUK6PYk0
         9Oc/O+AOF5GaQ+MIv6SR0nPmsXVAqndXh6m6X/Cm/xPbJmA82pXNteOCYRuWmySGLlCI
         tNgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/RVubQRlFmyh4sBKG2wLnYUF9xxu+g6QqTha8IWoqtI=;
        fh=PTAfnNvbTAY+Uzbho0oZo6hy+ELR7d890Ypg31lhQl8=;
        b=jDya+WXlk0kfcdB7Uh80AKUcvnwwhEuC91TTaFD9VJsP1UqnT9FIAfGBGZp4eCrbkm
         4ll0TDIEiEzI5gnLCgPUNapOqgCorOygTv6mTSmqIZSEDnty6cfHW+WcZoXrpUbbCWFX
         YKGxzWu5dT8zXYhtEueG+u2/P9eXl3dDJwE8WFTcYMR4peqGDpOU8ekyHlvvr/A3mZNX
         Ba6Q1XEv/ygnTz0NX+5f5GQdUzXQpdiHGEi2P6sXEOhuHzs39WT3pcrA44V1Indmpp6V
         XTyCXOCJ/NC/vCDFyFkaaQtRZj53n14DA8CgSXvzO4CuipmKqXlU+T1x4ijWq1P96ZnE
         vgbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792503705; x=1793108505; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/RVubQRlFmyh4sBKG2wLnYUF9xxu+g6QqTha8IWoqtI=;
        b=HoNoMbZvKwdhbuHIEWl7hhyyyfgBibJD1i3gDbMRuZ2A0sdVOE2rMAQJFMDDGYa/Py
         pavRqJOJdhJA+jr1qId0h9Gv2ScXseRE+Kp1y5Ud8yeLXOHNDazZXnvORezi4y3Ab6JC
         c69t52y6gdP3eGmUUD4RgnMsbxQt6cJBt0Y9mH/XyAmcCERMT2WDs/iNmFlVVj4EH0L4
         yDjs2oJ/jZs4vurWFzzyoOh3TWXqrQhMR0qUDBqsqBWQ/ZzADcosoeeZdpXgabw09cdY
         uc3asnXnGGXI6O2N0U8BxjxFKLNFmVFCpTST/gJyTVrIZGLmm5TqntEWp91ayZsy/DzP
         ddaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792503705; x=1793108505;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/RVubQRlFmyh4sBKG2wLnYUF9xxu+g6QqTha8IWoqtI=;
        b=BkFPhbQdQOS/iwuBbSMiHxxPK10KOJUy/OvVpQv/xNDI6Unb0nvH0wQWqN0r9tZRXz
         bi5Nd8iZoM+XcnZ6vu5jeumikXIjCxI7t6BoCN/pNhjItLn6mvEJwxd8dk8uk9bsiQy5
         p6Kf1fo1onj0q/sAKiziEhoTRRBrPo3dL5NSS3VGySy+NWXm7ywWnJTsym5TYAIJoxeb
         7WyMQydooUjFxb8iK7G7z0jXZ57rDIj+FFS+mdA1kH2fFA5eTb9vtblURmV44PFQaDGd
         Tr83GMbsYSHWnggxBWcpI7vwgfqjc8bIIbg1wZzsBRGl0m9qJhEyPJTMe0ElhaORhoyp
         Mw8Q==
X-Forwarded-Encrypted: i=1; AKwUvBz2omYGVPPJPGu/qM0KwpGjKNX4F0VSHaddtV9Njlb+E4NfGRKDg5rjJ5oaZQ0Ew0qP5NbtVoumAnM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJfPu5TXB6ViEz6iTqo543ZP3cea7ZZYKapUXdYvpXHQAbsRt+
	JTX4QjnSR/Mj4bb2CtRlIJEFzzcu48hNG7Ru4Wvm/TyW/9Q2vMfg2uPInbZFK5cn/c3nU9/J9qh
	IPcUdP4W6y6pqhovkoaf3yjfrvUGjV/M=
X-Gm-Gg: AYBFou0pBkUareWNnADXz/Xk9dNM8tZzxkNgtDhmz7SNoLrCMORBdwHFt+lAyWgvq6s
	zjveAqUopB7rZqq7HQmy6qJnsjiag372OU0zjK903ORa0RjIdo2To7ETpyC6kJqVspZ8glBbdIr
	YVMSmdg8BbLj9Y+/wnL98AXFxJPm2sm07COpIf0znIwi2iqc3AmeXbfpIvQMr7HZuUT2pNtUMZ0
	tWtyFQ0sb5h0gOu5sHzICPejykhtTombul6e0tnViZRURykpC2/UPGiYbaBDAxMPJUelnMIHTur
	r7M1Zj1YESnf2QllN4bPh5OHpYQH/1/2iwKPBhJK6ufmj1D+jA2uV8P2ihmg0dupt85uVBn9omo
	av/6a0F0mu5EK
X-Received: by 2002:aa7:d517:0:b0:6aa:91c2:63b0 with SMTP id
 4fb4d7f45d1cf-6b3a8160dd1mr6141869a12.2.1792503704806; Tue, 20 Oct 2026
 06:41:44 -0700 (PDT)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CABL4uFnCWgWdPL5s85O49sDyNADf4Lk684nx60g9wox_qOOOww@mail.gmail.com>
 <CABL4uF=f6Y06KmZ+ux2ZrboiLxivFZMyB_dqc4rTiEtiLd3GLw@mail.gmail.com>
 <20260925052929.GW106095@black.igk.intel.com> <CABL4uFn1nTrdxomWgAWs_gtsM5r1owt+4KOk1F39rXTLF3UZkg@mail.gmail.com>
 <20261016055802.GV176164@black.igk.intel.com> <CABL4uFncJktAvO9yVpZOjm=uAjLa7291deE9x805i8Kc7tFUDw@mail.gmail.com>
 <20261019061121.GZ176164@black.igk.intel.com> <CABL4uFkwcK-5fXWY_csebiW2G8i+49H0kfN5bsmA_wGTAeVBqQ@mail.gmail.com>
 <2d0ba53b-9f23-4fb1-bd97-637711017fa4@amd.com>
In-Reply-To: <2d0ba53b-9f23-4fb1-bd97-637711017fa4@amd.com>
From: =?UTF-8?Q?Pawe=C5=82_Frelek?= <pawel.frelek@gmail.com>
Date: Tue, 20 Oct 2026 15:41:23 +0200
X-Gm-Features: AclHuK_nVZh-GExGqycVI3TL-4yD8coRMsTXBSeIsj8fM_M71wxwSIRV7AJh8Gk
Message-ID: <CABL4uFkv9E1e1qbM-e_5-sS+wvV95Mxm3V79LUftbLDSebAddA@mail.gmail.com>
Subject: Re: [BUG] thunderbolt: NULL pointer dereference in tb_dp_dprx_work
 after device disconnect (7.2.6)
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, westeri@kernel.org, 
	linux-usb@vger.kernel.org, andreas.noever@gmail.com, YehezkelShB@gmail.com, 
	Sanath S <Sanath.S@amd.com>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

pon., 19 pa=C5=BA 2026 o 23:00 Mario Limonciello
<mario.limonciello@amd.com> napisa=C5=82(a):
> I have a few patches I was going to propose for this area.  Can you see
> if these help?

Hi Mario,

These are the same three patches you shared on
https://gitlab.freedesktop.org/drm/amd/-/issues/5981 on Oct 15.

I tested them on v7.3. 0002 and 0003 apply cleanly. 0001 doesn=E2=80=99t
apply, so I ported it by hand with a lot of help from Claude (AI):
amdgpu_dm_release_irq_stream() is a plain static function placed
before manage_dm_interrupts(), with no header change and the KUnit
test left out. The port is attached in case I got something wrong.

Test: power off the external monitors, wait 60 s, power them on
again, done 3 times, each from a fresh boot.

=E2=80=9CSending link address failed with -5=E2=80=9D: 2 of 3
=E2=80=9CStep 2 of creating MST payload failed: -5=E2=80=9D: 1 of 3
link_hwss_dpia WARN (line 60 with 0002 applied): 1 of 3

For comparison, with only 0002+0003 on v7.3 (2 tries) I had the
=E2=80=9CStep 2=E2=80=9D error 2 of 2 and the dpia WARN 1 of 2.

Thanks,
Pawe=C5=82



--=20
Pawe=C5=82 Frelek   (=EF=BB=BF =CD=A1=C2=B0 =CD=9C=CA=96 =CD=A1=C2=B0)
pawel.frelek@gmail.com
