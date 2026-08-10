Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869D92BE656
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 13:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786368779; cv=pass; b=lme6fKnfttyCb3dPqHLfPIys69zVI4ci8T7h8NIf+BRi9hCibJkpY5KTg1SZZ7VnpgBusUEpiUWEEHKPb+iy/6aJwgvM5/17uDBJN5KYQ/vu5PMjMILQjL7eK+ZLErxjtndW/lz4/fCAHx5d0PT/O+xaKhztn0dgxnwGcT9X4vQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786368779; c=relaxed/simple;
	bh=j4fdJB83OgkfpDFpn8eOXag7cSqCJ6o/mUw8wWH5rc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aWKubHEAqgCPAMdR9qAn9Df/81ODxr9Zj3X/sqvqrAYCRfmvLRbqSXlxjXI8SNICHHOM+bz7Ix7H2yMxLWh/8O8ZJv5JlbmOmIbc9EHKRbUIAQHlghZSGBwyM0WVuvycg0tc7lSWqRvmrhVqJ8hXX3KjmKYLpnlMNENwSzq3mPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=apTmBob4; arc=pass smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="apTmBob4"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-4472500e25fso780182fac.1
        for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 06:32:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786368777; cv=none;
        d=google.com; s=arc-20260327;
        b=I3hPEbJxuruMcUea2jOOQGq6tqo4uXYqxtl5Kjz9ebB0InD1Q0Q3FTEZJczOXsop3F
         AFPTLPRc1+FE76PyyMBD3H16jFZSRuiQmdzLtI5Ryz+yjzsK5xGNDMNoLtFW9/5LJo9p
         RP2qE1Y9RQL2qP9GdSWG/GmmP7at0apM0bkU3QxOqUh1OZ4PHSP1vVbKSEl7RRYHEM2N
         Gw3c4SqDxyStBgNw16sdHLY/qkpD/On9BYcUmqyBRCQBTuaIEGHAoTXUQ1N2S5C/I9tt
         YRhd8HtpQP3uU8ftPU4uYx0NCzI196dMJsJoCtow0JwHVqdVnQjOytOR2GECiovS2Dgj
         yTKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=roc9S1a5x2gvGrqXEh82i6BdFvHALhfABuncZ0V+eZg=;
        fh=e19+7uM7b4e1Ejf86stA+rositz1eYxPR/rkYMvTFZ8=;
        b=Tr2NNL6cimXAg0rCFti7iyKz0wXOt8AyJ9JBzWSuyl4O+i31WczpUxfmRO5sXsoJyc
         06OQI6PQ1MnNMJjBjYxGdPORH5NkCqGKGmYHW24DExojZUaalFLU9pvRLnCX5XtUqlik
         VqqRigL3SC5yiCYI4drhG+fQLwUV2LnOQHZ5Hi/VrcJ4gmn5MNCL7Bp2RfOpCurwuPV9
         wfaaSu6iJXE8QDzw713CFjI9EEAXmlK/e4x+A0zC+CZDjeI5/qh/veLjR8OQdldMQU+w
         1KxjmTqxEWlddPDBQ4ifShCX7oVmX/RTm3MXW9e/HVd1hHQ8Uy0AYmtURC2ENBGZOfMV
         K3JQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786368777; x=1786973577; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=roc9S1a5x2gvGrqXEh82i6BdFvHALhfABuncZ0V+eZg=;
        b=apTmBob4QIr3twF45Vgg+rTrZD0GB0olkQzlq+ySNkICwvn5TjNTPZc6fiVqwpO0cl
         UfUj03HmEsA+tujX/3hZqhT7Smgcbqvbmr2YrcfFMIDyXRYG4xkqth+EW7/tNZXTWTn8
         99krUXsIMfnDAHn37g6itmmcdxU1jtmzxVFt+JwD2CB6WkurOS3cW1cu0hHaLxQLK+u4
         5JJwYnohVlNVq0yHGz9GU+/wTEAvUMTaqywA2mPW7o7oBkNf/O0KuK90x/LAEigl7MAq
         WICl4vYhI5WeI1guwhW/DI55mwRDQ1k1j6m4c5483jlYPaAkcIAy9nNlk2fDqvxfkssV
         tdyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786368777; x=1786973577;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=roc9S1a5x2gvGrqXEh82i6BdFvHALhfABuncZ0V+eZg=;
        b=gU1Yeg2wTQj5ujPRDONSLSGq8rzznrD8YJrn8M4htz3p6rj9R8OG0L1von3yt82p/z
         W6CfQybTep9waqTB3/EGqC1E/+7HjlfcXoWPETXIAdqCZjELGsPicPqjoeJ/GzyEtxdm
         9o6XUkZ2hraEMWvev2NV6kOpWfXoDIkk77oh5QTdgAGN1lYYE6AptiShbwWaAMdexgLG
         1gU8D7c6lq/HZP1wgONnDf3fgeartB6otOBcKpMJaWloPr8Xvq/JRAyTGArSnOdJGrM4
         Fdv/qLBLJtYMAJ8OHLWY//hlE8AM6vGSLZVxMpNcWxImjT3n1iL8bjcLhm5an5yF9XJ5
         f24w==
X-Forwarded-Encrypted: i=1; AHgh+RpoyVh8OJcv+FukzTIOWgOE7NFG/6x9qtB5ZorQkSwIZFRoTwoBuPPWmM5IUM7f/E5kEZD4DPWfgmk=@vger.kernel.org
X-Gm-Message-State: AOJu0YysaEtSFUPE8vWG/FFo7PJYvabjoz1B7SAtl9MJBt17/iue2k+v
	KwrAIm6tW04Gu99fG8kJ2tHQBgrNwGXpo+ab50nK+9jiBSJmckl5DyT73Tv0xvWjc7gEUXi+c8F
	zAJMCy+WEEkf0IjrwI+CduKwd5/FzlQY=
X-Gm-Gg: AR+sD13HMrty7Hku6rHaUDmb48M67Z+LSjUUoYGZzaihQGv3PhdiEwWcQnSPX9ZKfQ0
	XH4r2bUV/We8zNYsJ7s0z8KNmtYL7V0hQnLIuoTm236TDUKSSRAGfx75tDWIG4UlelKRBpc2ZGf
	CvAXJNkorna9SMIJgbCM/ILBB+ti6/DMvrYQ+9GVuCmYYbVBh2GsbXHDWx7eUITJFgGTyyseLy7
	CfzWoDB9XfumDSwQnD7xf8xJt2H90xI0K6Q8cpTt7PTVZ0atFs+sdi6rjs7NbKj5rS5gLZGjpHI
	9p+n+Bfe9AneV4QjuTTsDvH3hKbJ9SXzJtyOVRLF+zSJ7fz8p/mxeglXTKTZVptRbFyqdolLl21
	uGwVvZs7TRg9Yhp1PUYPFvgY09oguf7ZzeDTuVZY4zqICSYjF605IgLD3qw==
X-Received: by 2002:a05:6808:309f:b0:4a4:744:a4ff with SMTP id
 5614622812f47-4b1e7709011mr939902b6e.4.1786368777312; Mon, 10 Aug 2026
 06:32:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810103409.133796-1-fabio.porcedda@gmail.com> <annMvEUa7sUvVIfr@gmail.com>
In-Reply-To: <annMvEUa7sUvVIfr@gmail.com>
From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 10 Aug 2026 15:32:21 +0200
X-Gm-Features: AUfX_mxVKhydZDc9mSz7qXovjZ7jMm5XgJfbsYaYFTfSaUt4W52YohxggxigRWw
Message-ID: <CAHkwnC-RM+R08MJtwNr=QFPcA-WT-P8JFaospxF9-YKe-yVsZA@mail.gmail.com>
Subject: Re: [PATCH v2] net: usb: qmi_wwan: add Telit Cinterion FE990D50 composition
To: Breno Leitao <leitao@debian.org>
Cc: =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniele Palmas <dnlplm@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 3:07=E2=80=AFPM Breno Leitao <leitao@debian.org> wr=
ote:
>
> On Mon, Aug 10, 2026 at 12:34:09PM +0200, Fabio Porcedda wrote:
> > Add the followin Telit Cinterion FE990D50 composition:
> >
> > 0x0991: rmnet + tty (AT/NMEA) + tty (AT) + tty (AT) + tty (AT) +
> >         tty (diag) + ADPL + adb
> > T:  Bus=3D01 Lev=3D01 Prnt=3D01 Port=3D06 Cnt=3D03 Dev#=3D 10 Spd=3D480=
  MxCh=3D 0
> > D:  Ver=3D 2.10 Cls=3D00(>ifc ) Sub=3D00 Prot=3D00 MxPS=3D64 #Cfgs=3D  =
1
> > P:  Vendor=3D1bc7 ProdID=3D0991 Rev=3D06.06
> > S:  Manufacturer=3DTelit Cinterion
> > S:  Product=3DFE990
> > S:  SerialNumber=3D2aa802d2
> > C:  #Ifs=3D 9 Cfg#=3D 1 Atr=3De0 MxPwr=3D500mA
> > I:  If#=3D 0 Alt=3D 0 #EPs=3D 3 Cls=3Dff(vend.) Sub=3Dff Prot=3D50 Driv=
er=3Dqmi_wwan
> > E:  Ad=3D01(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> > E:  Ad=3D81(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> > E:  Ad=3D82(I) Atr=3D03(Int.) MxPS=3D   8 Ivl=3D32ms
> > I:  If#=3D 1 Alt=3D 0 #EPs=3D 3 Cls=3Dff(vend.) Sub=3Dff Prot=3D60 Driv=
er=3Doption
> > E:  Ad=3D02(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> > E:  Ad=3D83(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> > E:  Ad=3D84(I) Atr=3D03(Int.) MxPS=3D  10 Ivl=3D32ms
> > I:  If#=3D 2 Alt=3D 0 #EPs=3D 3 Cls=3Dff(vend.) Sub=3Dff Prot=3D40 Driv=
er=3Doption
> > E:  Ad=3D03(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> > E:  Ad=3D85(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> > E:  Ad=3D86(I) Atr=3D03(Int.) MxPS=3D  10 Ivl=3D32ms
> > I:  If#=3D 3 Alt=3D 0 #EPs=3D 3 Cls=3Dff(vend.) Sub=3Dff Prot=3D40 Driv=
er=3Doption
> > E:  Ad=3D04(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> > E:  Ad=3D87(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> > E:  Ad=3D88(I) Atr=3D03(Int.) MxPS=3D  10 Ivl=3D32ms
> > I:  If#=3D 4 Alt=3D 0 #EPs=3D 3 Cls=3Dff(vend.) Sub=3Dff Prot=3D40 Driv=
er=3Doption
> > E:  Ad=3D05(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> > E:  Ad=3D89(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> > E:  Ad=3D8a(I) Atr=3D03(Int.) MxPS=3D  10 Ivl=3D32ms
> > I:  If#=3D 5 Alt=3D 0 #EPs=3D 2 Cls=3Dff(vend.) Sub=3Dff Prot=3D30 Driv=
er=3Doption
> > E:  Ad=3D06(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> > E:  Ad=3D8b(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> > I:  If#=3D 6 Alt=3D 0 #EPs=3D 1 Cls=3Dff(vend.) Sub=3Dff Prot=3D80 Driv=
er=3D(none)
> > E:  Ad=3D8c(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> > I:  If#=3D 7 Alt=3D 0 #EPs=3D 1 Cls=3Dff(vend.) Sub=3Dff Prot=3D70 Driv=
er=3D(none)
> > E:  Ad=3D8d(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> > I:  If#=3D 8 Alt=3D 0 #EPs=3D 2 Cls=3Dff(vend.) Sub=3D42 Prot=3D01 Driv=
er=3D(none)
> > E:  Ad=3D07(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> > E:  Ad=3D8e(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> >
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> > ---
> > Changes:
> > v2:
> > - Add stable@vger.kernel.org
>
> Why CCing stable?

I've added it so it can be cherry-picked into the stable and long-term rele=
ases.
It should be legit for adding a device ID.

BR
--=20
Fabio Porcedda
