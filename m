Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795712400;
	b=TnHsqTrzyrM2wOk4RcUOtcYycGPE5CG3/Bowyc1SSeYEq1zBMlUq6R0jtgl8HUvMMosy
	 DGm8WhEzorznUgILlu9kcQFBCnRoZsgnTXb4UgGiS7U49obH33y3dm8mTLLjGWmz0cqz/
	 7F7II4w3zMmZn/4LKB2Nxh5FQ01/xgFX11gkbUBjOVS72hhW7jqFanrFtDHj42pt4ugEd
	 50Re5IDl0wUAyRS0A3x1tFkUrAT+/TTfW29jSa5RPcBvX+1ONaJPwX6jPR7he90VwDZah
	 W19HJUHAYNRm53V16nACRoGATsbQ0Z9khumQ6wuN12xz3a2D29I6Fb+WF+eej6NBASg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795712400;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=Fc7wfjMvfMYlhV6E3+SfnUzQrbkmU97T4dDgWeh20r0=;
	b=ciVsI9swovfwC5R5MGZN2cR8LaqZ+7hojOlBI7Q1AHceKg/A/MzZQeB5gPwymedDOBEL
	 NZ00ZLKjLDhzxEJzDs7wrr8FX2mKhkGWfvww5NyjKITM22jRPUuE2fuV+cWTzL1gzKdGW
	 SGqn3K0eWeXMm6OLU+5/t7Hx8jRhNaHwreIwjvWslN8pbqsmYuCJZa7dx9rVMcJoyQhsG
	 3qXKI14/EHYpJMggkF3tJbpBD3QzDuOQUs8hEf1CHti+0Q5SzkW+1OupdEUcYUoSzEfLc
	 xbjRQXAvu161pEKWm4jbrpNSW7w2dAxAlfpGY52o0iFjzL6T8+Ye95lp/dju2wp6Z5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=aloebbert@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=oZitOu79;
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0FD606A323
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 16:59:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A0FD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=aloebbert@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=oZitOu79
DKIM2-Signature:  i=1; m=1; t=1795712396;
 mf=PGFsb2ViYmVydEBnbXguZGU+;
 rt=PGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.de;
 s=s31663417:rsa-sha256:Gq2q5b7lMH4kJg01HiEsderPREnQ
   xVleVqVxtBBPG7vExT/d9YI0OPEifNuHc3oILdSrsqrKHudb6wW3f4czUk+Q4n8rWaA+vx+d8PT
   dyWTfGGGRHZoEt8/kUJkJuBn6SudvQu0q2fOKkyiVFg635BtPZ6dc7CZ6VudpbpuBKmuUv35UY5
   aT1WnrHkDC703PDQaxTBolCzaf+N65A2icTm8mz2zDTOFkPwdfdDOX1FlR6/2C89C7rmPW5Mfsr
   kbynjIpT71vy+ITOLay4SHKFj8tzH+716a4rzQwXtmVC2ZuQ6qx8s7Nsc3yv2TWIROmTiqsO98J
   ihrzEZ4Cai0Pbg==;
Message-Instance:  m=1;
 h=sha256:
   fR73Xrl1u7Chraa11KwweFLE4J3MMveVMNdymyvA5Eo=:
   0Se0+4caMWWrzNH6Ll03nNHsUPqsTTgixJBIVK4GCHM=,
  sha512:
   A7Ub2DxptriK2gLgLyYm7mvfvAmkYkdzN0Ivi+9p5hohrIQ2GRiywJfQ7eF/mF3dRUnsbwr6xwnMk5TVluy5ag==:
   5bSeQxdY6hKsY6uV/lJNC3VZJxD1xpa4zzyBhxfqD1lE6D1FZFd4ukS0CtlC7rO1zbNN2hTIJlCU59OkrPwCmA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795712368; x=1796317168; i=aloebbert@gmx.de;
	bh=Fc7wfjMvfMYlhV6E3+SfnUzQrbkmU97T4dDgWeh20r0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=oZitOu797a425t1TRbWnwk+Hm71dIi44VX/NWr6j4594dbDj5sGNm6xoH1h8KUV7
	 KKJfoOtAzz7z5+utDjhfy89Dl5nM1/PFcfZCJDunPusL6wo5eqWr3HWObPEowPNNj
	 eMWEwTXXpHDnLaQ3jEJF/YCBTiLZkFjuAhGSR1W3GQjoTb8QiV1frnSXmWJMS62Yl
	 YmvtJXjfuzPICsvOAuqvLZcOL3X8zBiYw7W+dtLtb/jSDw+awWqGm/nisbVAs+WoW
	 HuDVmCMKGWFJ0SaGvX2C4QqFvvrfw4vPKfPJeVbDpb4iw16tgIXZrknN2Y+eIK5o2
	 +wOZhmolVi9KmI2x7Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MGyxX-1xkdIh11gB-004fPR; Thu, 26
 Nov 2026 17:59:28 +0100
From: Achim =?UTF-8?B?TMO2YmJlcnQ=?= <aloebbert@gmx.de>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Mario Limonciello <superm1@kernel.org>
Subject:
 Re: [REGRESSION/BUG] thunderbolt: ASM4242 fails to restore DP tunnel after
 resume on Ryzen 8700G (7.4-rc4)
Date: Thu, 26 Nov 2026 17:59:26 +0100
Message-ID: <bnvmvVhIQ2O8wiVp9S1lyw@gmx.de>
In-Reply-To: <20261126122715.GA953667@black.igk.intel.com>
References:
 <UCVQtIkrSxeOKGOgiChTpA@gmx.de> <y0Ed3XDFSA-_b1YnGjn2yQ@gmx.de>
 <20261126122715.GA953667@black.igk.intel.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPartRDrKY8kiS9mwV1l9GXnQ0A"
Content-Transfer-Encoding: 7Bit
X-Provags-ID: V03:K1:YPxaPeDeSNHquAo9RsYbZvlq/H1uM1mHkI3iqqUkaXwHnuWzMcm
 HChpFdSHTWaokEWroKIZanCQTnNpxaTzmNWFglWZ/RHVMRLf0+rAD5r+Amax7eQFCacoG9u
 oIwQPfs4mdcajpCdPKFYN3plGdblDXS+R3gGmNZ0MlVGhmIHmBCJIyuH/CyJEYd1SLA9ld7
 K9MBSDW+9JK5ww1aGk+rA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:J6oo2k8DhcQ=;XcCQRWTVxXJF4w8iUxyN1IwlxRL
 ktK0CO/5pOqwgy84CWqDY2ERgmF/VQ+D0zq9qxsUOUjptUBF15xnp4BmS8E3fJgtnixYf4t6M
 0bOMhsMgD1t0BoX7u3phDH9UaIMkH9XHB868hP+Ak2Nr+kbrsm+Du6cJp/S/xJOy+H2BhZ6VB
 1xBCm7HjyIAcdfY1ajvrzete2t1n4IIQRWiiwaSC+CRkUFHuzjmIr0sjdiJC9h0jYiOtjCQso
 XQlDQNHDnvk9uF4FbWzMF9PkCT+6GbBdBcyPdKpKyIvAkR5tarYk+4lJ8nPVPhao3kt1Jv3D3
 LY1fLU8pgk1Q5bTJboKsx2VEDiBrp7jpVqMEYuWGuZB3cmZkxKRdES+haaC0BOodB2ky4Cnhd
 +aqKPV8/oG17NB/xuaihIuz0zOolMwj++g75OFto6NlLnwyDA0yx5Y1G4e6HYwTcF/vbVJduy
 rQ/3RepALR20BGKgjQ50mH+mJIbfMOLxC2FgftNkAJ+eWbr1nFlzeAHVh68S0+GmweiYGTTFz
 rayVX9B+J6UZjs979SCSHMUNlonKjTVgM52zKBRbyU5iFZww9+mREXDcliTDulSlljCJMhatW
 QGLkV561F+GX0FpMNRXyetbYMiaXH/Hbo2hMrYU/OQd4ERqoM3aaWjaHGNCeayt25uasPXmwR
 Oo4J1hnyf4OtWbJscsNWffvsJjdwPZOlUhlo7U9ARwhdKFJz8i+4SVJzqdHGwWMKE6BVNm4Kh
 sRF4UA0S61Oz+W/DP2ETw0TmpUgbtW0+ikELO4qWLMnif3JIG+DEUR4axdBtX1mEvx7PjKKxK
 g6619Z7PPY6z8RYkZ87tYNc4IaSwaHptBn06cs7P8LbYH+/KouulXQ0u49mzKLmC3mSB2lhiB
 9+ObOXdXGjVAiVvzRZi/6w30g55pRvY8JaaWB/fDmZbm9Cr3nblO6yhB3TqM2Gcaqr7ZUYqd2
 sKP842uVGHMydJx956DGeBtdi/wF29IV6pM0f0h7VK4PUGuu/TtQyUtcd0XDrVHGWteQIg5zE
 mBxc68PJn93ech0pYhlXZtoiul/AVXFJU+R0RveLNIb9tskd119n+71KUPuyij3iseyrKBByJ
 fSHvlPjS42EXmsMoWICVFKPJunbgZUeQfnnW6kg3QZswVleaMPj0j5LoNAtzJrS/Ejz2JIib3
 UMu3SuNLZXbvas0BB54uGh5ZpX5jQEyzOgBwf7MpJ3D7S+3kpKGXfNpo/+5ALuqs+OI7xhw5s
 r6mMstH3AS+X/YzSD+I+UPU0aseRlJQkqwH/vgCrnQK03txuM5JPx5/PKNRjh+RKKcH3uSgPr
 ja1/h2T7ir0+uNpfLkq9qSd8G3RBKwoQgsyv9Hr0C6Qb+KzgnwJe50R0Ys5JS+zmv+aFQYTlr
 Th9utJhQ+f1FkJKqw/HoIkdH/zT7DBCS+epEzJq9SOkgzVt/SOYtRFxZ26ne261U3f8brf1ya
 GPj+PG5NxU2+nTIrj+nDnGaAAUmuu+qAwNyAd42jQtluv5MDQvA3Zaa/vG0rYc8+pWfLPhC0I
 WfFLGX4x20e08xmAI6Xx3yiCe/HwT3T2k3aI1QaIu7igVf1F4cE1Fv3X88YB8G3e9Uszb4llA
 2awYW53wfIWkQFWn+jMNgP7wPdE8RecRlPShFaBv0FAC3qOCfXyG46Qo5knB+FVi3dL25b5Tw
 CCwQoRRiXP5Dtr8FFBnVYVjtCH38HSSX6gCe3AXW4xghOVFYT81vZMbopVm/whOcBLUFXbD86
 GeKLFWDziuBDAvKHjJl04/lhE8/UFDK5xZ/Ejq9MQysJE/S+yFDCIn7GOdMHXROJ4TKn2yQMm
 AzS+mY8kGDwCMy/gX8MuKMvJHpKlTKntMz/1p2XrBcMGtlQ1ukBa41FusWuJFQxnl46mvedH2
 FX3tWQ1Ru1ULJ07RsEPpyy2xvSjQ+UQosIkLXlwmnTvWZQqO8BZrLkgwzqWWtY1yjrPaKwttG
 M64Glu4uUnHwRvEWB4688gQoVFTbCA4piXufKnWBVKTciBuz1hqTXzDls5jBzOuxIfaOZJOi5
 sZz5R653h6ntOJ610XBG75cGjTtcD+p+NDXUWoaRIsjQVAaRi6l3QtoeXxWhuq+KfRFPHzQJ0
 ybVe9seJHkHxzBaaKTr9wKx6Pb92IZgpn7FpnS0dhuzg8e7iba9Tqx7OWHNj0mzgidPjPWKfu
 Bxuj9XewByaZI5cWAtBRFCRHr1i+VfKEC9iQNC7nYUYB5ZPvcruIeywPMn23jNfdEOSHQaC0L
 4O2GGaZmohr3rvkAOx7H34Wk3v1C0FvYEjiUokZKPGnzvCj0/pGsHN9lYzuHgMqRd5xILqGPn
 /FSR785MDx8wG8hXERUyTd72O70tNoybunl40LsQDJgzOxpV36Fn65fMzQCMLOdQNL81ObBkZ
 B44nbPeQSF2UK25uHFYKXD/UIx63uw4bl+MY4mqLbyqBG+rClfgGorqGvbpqTG7/AmvbvMnTE
 tiUnYzl5+tkfO80ZlwPE+6tSi8m2Y50YHTyT7id9S2kIDDRlL2tVV93FJuafeU1lZwvQgIAMt
 DwS4JfbA1IQ+zCaPbKdzw+80d4wY2r7TxgqrN2zs1b/xbDJSQ6SemxdT2onK4xpPrryeSN01d
 rDXWxqERCgJrBH7WSOigaonQzKwGPDxp9IgusDkanxD1MD29iPpV1XU8/YP/41xS9NW/lISj9
 SUzDSeFc/W8Qeh08xzrNS1S826+4zsH8V7KiPMKX81Kq1IFNM8MbNXMYpf+2+gaRDINF7H7Az
 XTMJLYyr8KSyeM7wjXnbUnfLR+OcTb7J93KoC2OEQfBt3E6UPEQPnMaCMEKtbK7cIb9bksaaR
 dCz+fVlnY4dt5ZhpCrZYJ8KmhbndSLTF6YlcUPJUVBHpaM9BIeW81T9sglgrqqBxVgYUBALmW
 qJUSflKe5SdtIa+lKcrZkvRUGh3/pby4YATVugw0Y/Skr+4ycWbBUO9xo3+d2BTnuM0ReC3pa
 38t2q+ktr/L/oLhp2RfRcBzQJYfQvaJxeVE2GbVh03mX4mOGMKu0SiasrjGx8UD9OPgsWxRE/
 U5B6qbqNvUb2gbqzRX+GeTsmjCLkJgrTzB0PUdw+zTSvWActwLWyzqBSL/xD0AAnJMpf8Ahs+
 nLXceo0uqFBEeO7E/YyMzsRm28nlM4StfQoAw3U/HuiwbBtEHe2pfuYkl8AYUVJmEMuE1Jg1T
 MXKjbT2UwnXz0LvQ4CaxzpdgIf39od6fVZQ2FSag3bHt2qpvDrd/JutsyfKpvCdgGIoBbUUYC
 03p8jmGqTrywittMP3HskLltQs4BF2zUn1/DbCsrrew42OqMHruJ5OV9xYW1pkWvjwPplwg+T
 BssV3b/dCVW0drB/PW/4o0IgLuWmOavzU+ov2YPT2bq8Wk9g0dDMjmH+5EgUCf49W35hpABVo
 wth3iyleqEKjJ8hvHnmYhUnS6QYDOnfRhYo20roO16ZS6zqGyePL8GImBbIPiqKhD33xN844E
 iCrSS72uDKtDk6AUYNMy6CTEk5bGpAgSgvHCGfWzZj79+9acrlDp3KyLoBQCZhaZ84QhD9DBq
 q8NDjXN0h2bwsgVdqL+OaiirUDNVzi0pNT4HBrsgt+jl+wNueMaPvtRziSXre7MZvK1T88aTv
 CJ1D3owHcetiiC7qQWgC0J38ZJkbHWII5K9Prb7Kw8kuX15wJRs1b+p3Phqb1ETaovonzxbNa
 5o6LI2xCGkb4+BaBCStAq/sxF6ARJzv5aCQ2143w7aPKPuh8ihhaTaAtHk6NpZsEYW6IJE4sB
 zh+hIqr/kOUcZ15FOI28AbnZapph9I0ckc9oInC/LoKexVLwMkYAPxyr3U0pkB/Km4TX23fal
 CWXjlSR++x8zpnaXz9uNL1yci7mfsy0a1+k5p384fnDLBdJ0wpqaXp1lP1EtErc3uPr3G4PDC
 7STuR1iiad+P24X15oUSVUIgDea/IVxgo7j1VK59n8F0Iuq5ubarzqehxR3g2JD2YxZlx9yDH
 Dbsjcsk12KIvWInqexh8aAuoah0g035ETx5s8lppnSHQv+TfeLJnM/wffwSyxzjBW8lGwwrYW
 T4SYbiFk2l2FJ0zYfUQ7YL/tvy07ycwr06Riu8gc9170NQZ6IJV9M3cCRY6q40dNHRhNKmxzO
 Tl2vqceTF8T6TRKJZ19NnmzuCDvAWPOW3D9wkxn0Oy+AU4rOGiD1vdJk+nNX3yi3C1Od9WJYi
 qMJljCQTR5sOYoi1ZvCW9Og/IoGbvFuGaHjzBHN4QySelLIFkFK6zmjWvHiob9trx/XlLS1DC
 xFUOJcuvDVo/dcIu7MHJn363QejhyyPkj3JL4/1ygGPLsPcWxW/e1r2gj7TyktbZPUsCaeWvR
 PJs27CCPNYvHDbcjrcvt2O07xyv8sPzRHRQcLF69XjNyWZWGuZnqtE6DcsPv2DuN7LpAvAMBr
 SyXyAgxb5ghnoL5UrPv87tU1Ds564x52EEGeCIpMO8JLszn3GWi4CrwuBwrDiSoK03ZzqhyYy
 e0b5kN9Sby1Lx2M/5XpmkvmMNe3FFMMtduVOC9wWcZJfk+s4vfGbyPPUXt5dzaIuS/6Q8qfZY
 pIJrTtzz4o8wYErC3/MGDQzjFqzL3S+QJkI0InQJp3pkOQCFjB0znvKeiUjiNQ01w6ako1n6I
 +Gcxlcf3WA5M5Ujss698ObyrIcVRcDU2S8+EjE5SlLGN2f2EILFCIgLrdnGsc0T3j2t31c88H
 /+l8Zgw7vpEeMljR5/GNJDU6FXAZ/pbWimMlDj8GhL7Uruatf8339Sy4BWOsoacHTGoB/wg/A
 fYgD5MTLgD40yAfX2kUnp+W9rIr8+ZSFoAhBd5WuvvnUOlB4ev+lhMw0QyMaXn/STeaG6CCwz
 W79ZatwtthjfM2DuHS8BQdVUMU2AApS9e4R87snMOi+/XNBjbLdCNAViG1M/P8ewnb80l1bWG
 jUdYeuQHPqfwMseP+bIkpKzecB0ci7g+wazJsJTT0l10GE2XLKRdwTGE5yUv5qeIDyqVJCsge
 eC/JFnOYj7DMczCBSw5zI1GB2+aQ+Yem8Dd4c+yJe3ZcHoYLJ7FypQ7W6/AIwyasxZmeyZFgO
 ikkJIN6intX68uVIDsQQiXhZ5LsIYnUgv5DN+NondG2GeXobT5eOGfOZrwQ2vmZamf+RO90nu
 0zlg+LNSnTmr88mwKyne8hwU9Wq5CZI5nHD629LiLDL+fXp32xpVgLmKogb0PRjZJx+nU3ryU
 OODoq5NmXCPQvpjC55SdgNvxWGG7L7GjPnI6iYgi9Grzw/PWfJa5BYPUgjOq5BOhgcV2Qc4q5
 0nitDIxdGiyGFwYUv8z5gLHFroGPRlJ44hBABplVNwsn+jFR9hxCZMWf+UQyzsFygFdilIP7I
 sBFGtveRV7BjXycyro/YpROkkVbTfXLjDlV1c6e+rJtsfE1Ha+lXPfS6+ks4PCW0LyAGSO9Gb
 iE4epRfFNIAKLlb6YSMnqfHp9FZvAjoHG1/jI7Q76XSrVw6ZO2bq8vuQC3nOr5UfGvXCYNdG+
 ToAQUB7vAuW0WjSPoIwf9tTsJwTjZaLqMeUvpK+Phx+AbUgh7PTFXQmcNWUUuy4RIt4FjsfEb
 kYGuRZgfhW7VLSfYHxKzVtQvFwrsTWVewb+e61MVOijpAog2XyQXcL9NQdAaH3Dt5eiqTysKo
 SN/FFrhr70JsY5+zv2o7Auj5RgdcrWzAZxlbp9jNAkfUquaHMmZrPTQfoznzUNgtJwUwEO5wt
 zTJNpfoR8/eFKFHH6Mijjto8xPfzz+4D1Yb2HQzCtAnViJQhHDXOulTz0NkZ4oCAv2Jj1hRRy
 NE/07UXRWmbgezVLs+DXlbTiMkDYrQ04yuKENXEco/YF5dz//ErT9ztZ0MOjtE+NDwMNTa2+X
 1XTvBVnHKu5JAImNtyPni2hgVo1D0Od2Cv9US4vZnrJExKE90S2FlXr1XzVnax/b6S85FK/lX
 WwiCmuK8Cs/RArdacpIjx3F6qTsmd+kzomYkg9kdIMDsQDOvciX6S6yOysUIs4H+GmkKSYhJh
 6L9Uwv75ZENDjm2yTAKzcp76OtjZqkkXVhhkt6NbeF1nupvPxvv46lH9wPYoncmLSLNDkIxFq
 +gibK6PxC/9fZUUHJN4eld9CpPJm2dv7AGZzxBCC1EGtgkiG/qgIM4KbuBcwnE5Hdb74Gjej8
 nijG8Yy1FMKTcJ3FRf3gLIvUHEO+EKgNh+mJDgSbWFb4kVwYaMd4Re9oqzfwlbrY97oOtyTST
 rHbRLPc9OaKuyN2pWC8V9Z1TZWrjlXnLeGTlB7pC0IR8/sPvybXsjZmSwquCCT4N2+U4TIKI2
 ailSSH20PxvzPAsRx2R0CRDg4jmOMmqFu8hXij7sZAEbmn4IvQKToqHbcCYPYBRouMNrg+V/n
 tWbXDkqe9CGK2da2vdtMzyXIKwfY/OvaUnXJvuYMCQ8cOBcmAzdu7YrEE34cUK8GHh+uKFAAL
 giCQOQMOXVc14+5xy1VqFkv1NITerm7wzoejZNqB3cXYg04sangFg3yH4NEV75Plx0cKUi1C2
 C4v2xB5Y+nZqyZR3YO1GYhhK2RWcJj9s3Uisx6oaKDm6FwxPQXwFbh/nKTKMtRaGs+Pw/0wLk
 HuuCHPjmGEeNslwOGzFN40iZwhr1/lswLUaEvG87CGCUkER4nmXPmVg06q9H1vuiPx/Onmqj/
 GGUIEEB5zSk3dfZOV2erHhiwwgN3XSiifMWubZ/VRdEKsW2fGHaHYUyRuQD82cyGlFadh/pl8
 iVZET/N81fLaB1xxmorh/d0MPUXPvQs5okMm+89zU3ANCTA3HpbNvOytSboODRoymLHD3n8pn
 2wjyT3vrMavuc4Sq2sboarHZeO2flPPqfuRGB2rZwF3ceK/VxLAf5rJCL2selaiy44OFQ19iP
 mTW/Vx87Aeh7A4gcxgeBhtU9JkueU5zK0cVs+mN49IhIgBNZiOTUXkRaKwytW8yBWnPIGuoGR
 wCpRn/Kv5lm0fpl2CXZC2IdO6gt8DfEqupoOZU/a8qk/oxzSXnSTA6sGCsyWPORsxVhFBIJ0y
 xHM25MofncfGZGXJ1ajQ57x1f10J+cnOlhGTu7PyOzJ+qQdEjLQCiZ+Wr1Q4HJn83FaOG8GKK
 +N1dBcjgWQgn456BosSxxYT2/maVgPkXgGmNu80iDvHv/JSY2k/Bd5iarTBseULCOTsL/ytdw
 KjhVmeLrT3ZpRaGiomsn2yASalmy9a4nLD/RYyHHbLgqbR7LouywdAggIAkjKRD00B6MVvqt2
 eaPZh7cUWX73TNOvreMkIdtKP9lLFxE/G7Dphq55k9uT6c1JUvArxWVYURLT5ExNOmBj9rK8r
 ISNNYx5SVqW9zLBevL7yBUR+Zg2pSUjzh8TjtY+SFw4H6THaKYGZHqFPWCTmGy6pTQQgh3+Up
 GjpLvB+6WS0w9IJ

This is a multi-part message in MIME format.

--nextPartRDrKY8kiS9mwV1l9GXnQ0A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Mika,

On Thursday, 26. November 2026 13:27:15 CET Mika Westerberg wrote:
> Hi,
>=20
> On Thu, Nov 26, 2026 at 09:53:05AM +0100, Achim L=C3=B6bbert wrote:
> > > Can you provide full dmesg without anything non-standard, except
> > > "thunderbolt.dyndbg=3D+p" in the command line?
> > >=20
> > > Once the host router (well any router) is enumerated during resume it=
 is
> > > expected to send plug events to the DP IN adapters that are available
> > > for
> > > tunneling. That does not seem to happen here but it would be good to =
see
> > > the full dmesg first.
> >=20
> > Hi Mika,
> >=20
> > please find attached full dmesg log with command line changed as
> > requested.
> > Still have a black screen after resume, until a manual re-bind of
> > 0000:71:00.
> Thanks! I can see that the ASMedia controller does not send plug events to
> its DP IN adapters at all. My interpretation of the spec is that it should
> do that but I think we can fix this with something like below. Can you try
> it?
>=20
> I haven't tried on Intel hardware yet so if this works for you we should
> still check for both AMD/Intel that nothing breaks.
>=20
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index 4db25062b5e5..964191a1e0ab 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -3198,6 +3198,8 @@ static void tb_restore_children(struct tb_switch *s=
w)
>  	if (tb_enable_tmu(sw))
>  		tb_sw_warn(sw, "failed to restore TMU configuration\n");
>=20
> +	tb_add_dp_resources(sw);
> +
>  	tb_switch_configuration_valid(sw);
>=20
>  	tb_switch_for_each_port(sw, port) {

thank you for looking into this and sending the patch. The patch failed to=
=20
apply against 7.4-rc4 (line numbers seem to differ, but it was easy to edit=
).

With that change the screen came up within a few seconds after 1st suspend/
resume cycle after boot, much faster than the workaround using unbind on=20
suspend and rebind on resume where it took randomly between 20-50 seconds,=
=20
measured after wakeup key press. The unbind/bind workaround is robust, thou=
gh.

With your change, on the second and most of the following suspend/resume=20
cycles the screen stays black again, unfortunately. In that state when wait=
ing=20
for a couple of minutes, monitor backlight suddenly turns on by itself w/o =
any=20
keystroke and when pressing a key at that moment, video signal sometimes is=
=20
back instantly, sometimes not at all. Pretty sure this was not observed wit=
h=20
the unbind/bind workaround.

New dmesg attached with your change showing 1st successful suspend/resume=20
cycle after boot with video displayed, followed by a couple of resumes endi=
ng=20
in just black screens.

Please let me know if I may provide further information or test results.

Kind regards,
Achim
--nextPartRDrKY8kiS9mwV1l9GXnQ0A
Content-Disposition: attachment; filename="tb-resume-bug-dmesg.5.txt"
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"; name="tb-resume-bug-dmesg.5.txt"

[    0.000000] Linux version 7.4.0-rc4-x86_64 (root@dt8) (x86_64-pc-linux-=
gnu-gcc (Gentoo 16.2.1_p20260926 p1) 16.2.1 20260926, GNU ld (Gentoo 2.47 =
p1) 2.47.0) #2 SMP PREEMPT_DYNAMIC Thu Nov 26 17:04:42 CET 2026
[    0.000000] Command line:  dolvm crypt_root=3DLABEL=3Ddt8-luks root=3DL=
ABEL=3Ddt8-root resume=3DLABEL=3Ddt8-swap thunderbolt.dyndbg=3D+p
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009ffff]  Sys=
tem RAM
[    0.000000] BIOS-e820: [mem 0x00000000000a0000-0x00000000000fffff]  dev=
ice reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000099fefff]  Sys=
tem RAM
[    0.000000] BIOS-e820: [mem 0x00000000099ff000-0x0000000009ffffff]  dev=
ice reserved
[    0.000000] BIOS-e820: [mem 0x000000000a000000-0x000000000a1fffff]  Sys=
tem RAM
[    0.000000] BIOS-e820: [mem 0x000000000a200000-0x000000000a23bfff]  ACP=
I NVS
[    0.000000] BIOS-e820: [mem 0x000000000a23c000-0x000000000affffff]  Sys=
tem RAM
[    0.000000] BIOS-e820: [mem 0x000000000b000000-0x000000000b020fff]  dev=
ice reserved
[    0.000000] BIOS-e820: [mem 0x000000000b021000-0x0000000087c2bfff]  Sys=
tem RAM
[    0.000000] BIOS-e820: [mem 0x0000000087c2c000-0x0000000095dabfff]  dev=
ice reserved
[    0.000000] BIOS-e820: [mem 0x0000000095dac000-0x0000000097dabfff]  ACP=
I NVS
[    0.000000] BIOS-e820: [mem 0x0000000097dac000-0x0000000097ffefff]  ACP=
I data
[    0.000000] BIOS-e820: [mem 0x0000000097fff000-0x00000000988b9fff]  Sys=
tem RAM
[    0.000000] BIOS-e820: [mem 0x00000000988ba000-0x00000000988bafff]  ACP=
I NVS
[    0.000000] BIOS-e820: [mem 0x00000000988bb000-0x0000000099e83fff]  Sys=
tem RAM
[    0.000000] BIOS-e820: [mem 0x0000000099e84000-0x0000000099e85fff]  ACP=
I NVS
[    0.000000] BIOS-e820: [mem 0x0000000099e86000-0x0000000099ff9fff]  Sys=
tem RAM
[    0.000000] BIOS-e820: [mem 0x0000000099ffa000-0x0000000099ffcfff]  dev=
ice reserved
[    0.000000] BIOS-e820: [mem 0x0000000099ffd000-0x0000000099ffffff]  Sys=
tem RAM
[    0.000000] BIOS-e820: [mem 0x000000009a000000-0x000000009bffffff]  dev=
ice reserved
[    0.000000] BIOS-e820: [gap 0x000000009c000000-0x000000009d78ffff]
[    0.000000] BIOS-e820: [mem 0x000000009d790000-0x000000009d7effff]  dev=
ice reserved
[    0.000000] BIOS-e820: [gap 0x000000009d7f0000-0x000000009d7f4fff]
[    0.000000] BIOS-e820: [mem 0x000000009d7f5000-0x000000009fffffff]  dev=
ice reserved
[    0.000000] BIOS-e820: [gap 0x00000000a0000000-0x00000000dfffffff]
[    0.000000] BIOS-e820: [mem 0x00000000e0000000-0x00000000efffffff]  dev=
ice reserved
[    0.000000] BIOS-e820: [gap 0x00000000f0000000-0x00000000f6ffffff]
[    0.000000] BIOS-e820: [mem 0x00000000f7000000-0x00000000ffffffff]  dev=
ice reserved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x0000000fde2fffff]  Sys=
tem RAM
[    0.000000] BIOS-e820: [gap 0x0000000fde300000-0x0000000fdf33ffff]
[    0.000000] BIOS-e820: [mem 0x0000000fdf340000-0x00000010801fffff]  dev=
ice reserved
[    0.000000] BIOS-e820: [gap 0x0000001080200000-0x000000fcffffffff]
[    0.000000] BIOS-e820: [mem 0x000000fd00000000-0x000000ffffffffff]  dev=
ice reserved
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] APIC: Static calls initialized
[    0.000000] efi: EFI v2.11 by American Megatrends
[    0.000000] efi: ACPI=3D0x97d92000 ACPI 2.0=3D0x97d92014 TPMFinalLog=3D=
0x97d5e000 SMBIOS=3D0x8da1f000 SMBIOS 3.0=3D0x8da1e000 MEMATTR=3D0x81c5169=
8 ESRT=3D0x85a03098 RNG=3D0x97e22018 TPMEventLog=3D0x97e1b018=20
[    0.000000] random: crng init done
[    0.000000] efi: Remove mem260: MMIO range=3D[0xe0000000-0xefffffff] (2=
56MB) from e820 map
[    0.000000] e820: remove [mem 0xe0000000-0xefffffff] device reserved
[    0.000000] efi: Remove mem261: MMIO range=3D[0xf7000000-0xfedfffff] (1=
26MB) from e820 map
[    0.000000] e820: remove [mem 0xf7000000-0xfedfffff] device reserved
[    0.000000] efi: Not removing mem262: MMIO range=3D[0xfee00000-0xfee00f=
ff] (4KB) from e820 map
[    0.000000] efi: Remove mem263: MMIO range=3D[0xfee01000-0xffffffff] (1=
7MB) from e820 map
[    0.000000] e820: remove [mem 0xfee01000-0xffffffff] device reserved
[    0.000000] efi: Remove mem265: MMIO range=3D[0x1060000000-0x10801fffff=
] (514MB) from e820 map
[    0.000000] e820: remove [mem 0x1060000000-0x10801fffff] device reserve=
d
[    0.000000] DMI: SMBIOS 3.8.0 present.
[    0.000000] DMI: Gigabyte Technology Co., Ltd. X870 AORUS ELITE WIFI7 I=
CE/X870 AORUS ELITE WIFI7 ICE, BIOS F13e 10/19/2026
[    0.000000] DMI: Memory slots populated: 2/4
[    0.000000] tsc: Fast TSC calibration using PIT
[    0.000000] tsc: Detected 4200.207 MHz processor
[    0.000068] e820: update [mem 0x00000000-0x00000fff] System RAM =3D=3D>=
 device reserved
[    0.000069] e820: remove [mem 0x000a0000-0x000fffff] System RAM
[    0.000074] last_pfn =3D 0xfde300 max_arch_pfn =3D 0x400000000
[    0.000077] MTRR map: 6 entries (3 fixed + 3 variable; max 20), built f=
rom 9 variable MTRRs
[    0.000078] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- W=
T =20
[    0.000231] last_pfn =3D 0x9a000 max_arch_pfn =3D 0x400000000
[    0.002527] esrt: Reserving ESRT space from 0x0000000085a03098 to 0x000=
0000085a030d0.
[    0.002533] e820: update [mem 0x85a03000-0x85a03fff] System RAM =3D=3D>=
 device reserved
[    0.002553] Using GB pages for direct mapping
[    0.003441] Secure boot enabled
[    0.003443] ACPI: Early table checksum verification disabled
[    0.003445] ACPI: RSDP 0x0000000097D92014 000024 (v02 ALASKA)
[    0.003447] ACPI: XSDT 0x0000000097D91728 00012C (v01 ALASKA A M I    0=
1072009 AMI  01000013)
[    0.003450] ACPI: FACP 0x0000000097FE7000 000114 (v06 ALASKA A M I    0=
1072009 AMI  00010013)
[    0.003453] ACPI: DSDT 0x0000000097F63000 079C80 (v02 ALASKA A M I    0=
1072009 INTL 20230628)
[    0.003454] ACPI: FACS 0x0000000097D8E000 000040
[    0.003455] ACPI: _SDM 0x00000000988BA000 000055 (v03 ALASKA A M I    0=
1072009 AMI  01000013)
[    0.003456] ACPI: HWIN 0x0000000097FFE000 00006C (v00 GBT    AMD      0=
0050000 AMI  01000013)
[    0.003457] ACPI: SSDT 0x0000000097FF2000 00B10F (v02 GBT    GSWApp   0=
0000001 INTL 20230628)
[    0.003459] ACPI: SSDT 0x0000000097FE9000 00837C (v02 AMD    Splinter 0=
0000002 MSFT 04000000)
[    0.003460] ACPI: SSDT 0x0000000097FE8000 000221 (v02 ALASKA CPUSSDT  0=
1072009 AMI  01072009)
[    0.003461] ACPI: FIDT 0x0000000097FE1000 00009D (v01 ALASKA A M I    0=
1072009 AMI  00010013)
[    0.003462] ACPI: MCFG 0x0000000097FE0000 00003C (v01 ALASKA A M I    0=
1072009 MSFT 00010013)
[    0.003463] ACPI: HPET 0x0000000097FDF000 000038 (v01 ALASKA A M I    0=
1072009 AMI  00000005)
[    0.003464] ACPI: WDRT 0x0000000097FDE000 000047 (v01 ALASKA A M I    0=
1072009 AMI  00000005)
[    0.003466] ACPI: FPDT 0x0000000097FDD000 000044 (v01 ALASKA A M I    0=
1072009 AMI  01000013)
[    0.003467] ACPI: VFCT 0x0000000097FE2000 004284 (v01 ALASKA A M I    0=
0000001 AMD  33504F47)
[    0.003468] ACPI: BGRT 0x0000000097F62000 000038 (v01 ALASKA A M I    0=
1072009 AMI  00010013)
[    0.003469] ACPI: SSDT 0x0000000097F5C000 00547E (v02 AMD    AMD CPU  0=
0000001 AMD  00000001)
[    0.003470] ACPI: TPM2 0x0000000097F5B000 00004C (v04 ALASKA A M I    0=
0000001 AMI  00000000)
[    0.003471] ACPI: SSDT 0x0000000097F5A000 000CDE (v02 AMD    OEMACP   0=
0000001 INTL 20230628)
[    0.003472] ACPI: WPBT 0x0000000097E4E000 000034 (v01 ALASKA A M I    0=
0000001 GBT  25021100)
[    0.003474] ACPI: SSDT 0x0000000097E40000 00D2AE (v02 AMD    DISCUSB4 0=
0000002 INTL 20230628)
[    0.003475] ACPI: SSDT 0x0000000097E3F000 0006D4 (v02 AMD    CPMWLRC  0=
0000001 INTL 20230628)
[    0.003476] ACPI: SSDT 0x0000000097E3D000 00169E (v02 AMD    CPMDFIG2 0=
0000001 INTL 20230628)
[    0.003477] ACPI: SSDT 0x0000000097E3A000 002AA6 (v02 AMD    CDFAAIG2 0=
0000001 INTL 20230628)
[    0.003478] ACPI: SSDT 0x0000000097E30000 0098A6 (v02 AMD    CPMCMN   0=
0000001 INTL 20230628)
[    0.003479] ACPI: SSDT 0x0000000097E2D000 0026D3 (v02 AMD    AOD      0=
0000001 INTL 20230628)
[    0.003480] ACPI: MHSP 0x0000000097E2C000 0000C8 (v04 AMD    AGESA    2=
0505348 ?    00000001)
[    0.003482] ACPI: SSDT 0x0000000097E2B000 0000E5 (v02 MSFT   MHSP     0=
0000004 INTL 20230628)
[    0.003483] ACPI: WSMT 0x0000000097E2A000 000028 (v01 ALASKA A M I    0=
1072009 AMI  00010013)
[    0.003484] ACPI: APIC 0x0000000097E29000 00015E (v06 ALASKA A M I    0=
1072009 AMI  00010013)
[    0.003485] ACPI: IVRS 0x0000000097E28000 0001FE (v02 AMD    AmdTable 0=
0000001 AMD  00000001)
[    0.003486] ACPI: SSDT 0x0000000097E27000 000500 (v02 AMD    MEMTOOL0 0=
0000002 INTL 20230628)
[    0.003487] ACPI: SSDT 0x0000000097E26000 0009D0 (v02 AMD    CPMMSOSC 0=
0000001 INTL 20230628)
[    0.003489] ACPI: SSDT 0x0000000097E25000 00047C (v02 AMD    AMDWOV   0=
0000001 INTL 20230628)
[    0.003490] ACPI: SSDT 0x0000000097E24000 000FFD (v02 AMD    CPMACPV5 0=
0000001 INTL 20230628)
[    0.003491] ACPI: SSDT 0x0000000097E23000 00044E (v02 AMD    AmdTable 0=
0000001 INTL 20230628)
[    0.003492] ACPI: Reserving FACP table memory at [mem 0x97fe7000-0x97fe=
7113]
[    0.003493] ACPI: Reserving DSDT table memory at [mem 0x97f63000-0x97fd=
cc7f]
[    0.003493] ACPI: Reserving FACS table memory at [mem 0x97d8e000-0x97d8=
e03f]
[    0.003493] ACPI: Reserving _SDM table memory at [mem 0x988ba000-0x988b=
a054]
[    0.003494] ACPI: Reserving HWIN table memory at [mem 0x97ffe000-0x97ff=
e06b]
[    0.003494] ACPI: Reserving SSDT table memory at [mem 0x97ff2000-0x97ff=
d10e]
[    0.003495] ACPI: Reserving SSDT table memory at [mem 0x97fe9000-0x97ff=
137b]
[    0.003495] ACPI: Reserving SSDT table memory at [mem 0x97fe8000-0x97fe=
8220]
[    0.003495] ACPI: Reserving FIDT table memory at [mem 0x97fe1000-0x97fe=
109c]
[    0.003496] ACPI: Reserving MCFG table memory at [mem 0x97fe0000-0x97fe=
003b]
[    0.003496] ACPI: Reserving HPET table memory at [mem 0x97fdf000-0x97fd=
f037]
[    0.003497] ACPI: Reserving WDRT table memory at [mem 0x97fde000-0x97fd=
e046]
[    0.003497] ACPI: Reserving FPDT table memory at [mem 0x97fdd000-0x97fd=
d043]
[    0.003497] ACPI: Reserving VFCT table memory at [mem 0x97fe2000-0x97fe=
6283]
[    0.003498] ACPI: Reserving BGRT table memory at [mem 0x97f62000-0x97f6=
2037]
[    0.003498] ACPI: Reserving SSDT table memory at [mem 0x97f5c000-0x97f6=
147d]
[    0.003498] ACPI: Reserving TPM2 table memory at [mem 0x97f5b000-0x97f5=
b04b]
[    0.003499] ACPI: Reserving SSDT table memory at [mem 0x97f5a000-0x97f5=
acdd]
[    0.003499] ACPI: Reserving WPBT table memory at [mem 0x97e4e000-0x97e4=
e033]
[    0.003500] ACPI: Reserving SSDT table memory at [mem 0x97e40000-0x97e4=
d2ad]
[    0.003500] ACPI: Reserving SSDT table memory at [mem 0x97e3f000-0x97e3=
f6d3]
[    0.003500] ACPI: Reserving SSDT table memory at [mem 0x97e3d000-0x97e3=
e69d]
[    0.003501] ACPI: Reserving SSDT table memory at [mem 0x97e3a000-0x97e3=
caa5]
[    0.003501] ACPI: Reserving SSDT table memory at [mem 0x97e30000-0x97e3=
98a5]
[    0.003501] ACPI: Reserving SSDT table memory at [mem 0x97e2d000-0x97e2=
f6d2]
[    0.003502] ACPI: Reserving MHSP table memory at [mem 0x97e2c000-0x97e2=
c0c7]
[    0.003502] ACPI: Reserving SSDT table memory at [mem 0x97e2b000-0x97e2=
b0e4]
[    0.003503] ACPI: Reserving WSMT table memory at [mem 0x97e2a000-0x97e2=
a027]
[    0.003503] ACPI: Reserving APIC table memory at [mem 0x97e29000-0x97e2=
915d]
[    0.003503] ACPI: Reserving IVRS table memory at [mem 0x97e28000-0x97e2=
81fd]
[    0.003504] ACPI: Reserving SSDT table memory at [mem 0x97e27000-0x97e2=
74ff]
[    0.003504] ACPI: Reserving SSDT table memory at [mem 0x97e26000-0x97e2=
69cf]
[    0.003505] ACPI: Reserving SSDT table memory at [mem 0x97e25000-0x97e2=
547b]
[    0.003505] ACPI: Reserving SSDT table memory at [mem 0x97e24000-0x97e2=
4ffc]
[    0.003505] ACPI: Reserving SSDT table memory at [mem 0x97e23000-0x97e2=
344d]
[    0.004799] ACPI: PM-Timer IO Port: 0x808
[    0.004803] ACPI: LAPIC_NMI (acpi_id[0xff] high edge lint[0x1])
[    0.004816] IOAPIC[0]: apic_id 32, version 33, address 0xfec00000, GSI =
0-23
[    0.004820] IOAPIC[1]: apic_id 33, version 33, address 0xfec01000, GSI =
24-55
[    0.004821] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.004823] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
[    0.004825] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.004825] ACPI: HPET id: 0x10228201 base: 0xfed00000
[    0.004830] e820: update [mem 0x82861000-0x828b7fff] System RAM =3D=3D>=
 device reserved
[    0.004837] CPU topo: Max. logical packages:   1
[    0.004838] CPU topo: Max. logical nodes:      1
[    0.004838] CPU topo: Num. nodes per package:  1
[    0.004839] CPU topo: Max. logical dies:       1
[    0.004839] CPU topo: Max. dies per package:   1
[    0.004842] CPU topo: Max. threads per core:   2
[    0.004842] CPU topo: Num. cores per package:     8
[    0.004843] CPU topo: Num. threads per package:  16
[    0.004843] CPU topo: Allowing 16 present CPUs plus 0 hotplug CPUs
[    0.004855] PM: hibernation: Registered nosave memory: [mem 0x00000000-=
0x00000fff]
[    0.004856] PM: hibernation: Registered nosave memory: [mem 0x000a0000-=
0x000fffff]
[    0.004857] PM: hibernation: Registered nosave memory: [mem 0x099ff000-=
0x09ffffff]
[    0.004858] PM: hibernation: Registered nosave memory: [mem 0x0a200000-=
0x0a23bfff]
[    0.004858] PM: hibernation: Registered nosave memory: [mem 0x0b000000-=
0x0b020fff]
[    0.004859] PM: hibernation: Registered nosave memory: [mem 0x82861000-=
0x828b7fff]
[    0.004860] PM: hibernation: Registered nosave memory: [mem 0x85a03000-=
0x85a03fff]
[    0.004861] PM: hibernation: Registered nosave memory: [mem 0x87c2c000-=
0x97ffefff]
[    0.004862] PM: hibernation: Registered nosave memory: [mem 0x988ba000-=
0x988bafff]
[    0.004862] PM: hibernation: Registered nosave memory: [mem 0x99e84000-=
0x99e85fff]
[    0.004863] PM: hibernation: Registered nosave memory: [mem 0x99ffa000-=
0x99ffcfff]
[    0.004864] PM: hibernation: Registered nosave memory: [mem 0x9a000000-=
0xffffffff]
[    0.004865] [gap 0xa0000000-0xfedfffff] available for PCI devices
[    0.004866] Booting paravirtualized kernel on bare hardware
[    0.004868] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: =
0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.011803] Zone ranges:
[    0.011803]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.011804]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.011805]   Normal   [mem 0x0000000100000000-0x0000000fde2fffff]
[    0.011805]   Device   empty
[    0.011806] Movable zone start for each node
[    0.011806] Early memory node ranges
[    0.011806]   node   0: [mem 0x0000000000001000-0x000000000009ffff]
[    0.011807]   node   0: [mem 0x0000000000100000-0x00000000099fefff]
[    0.011807]   node   0: [mem 0x000000000a000000-0x000000000a1fffff]
[    0.011808]   node   0: [mem 0x000000000a23c000-0x000000000affffff]
[    0.011808]   node   0: [mem 0x000000000b021000-0x0000000087c2bfff]
[    0.011808]   node   0: [mem 0x0000000097fff000-0x00000000988b9fff]
[    0.011809]   node   0: [mem 0x00000000988bb000-0x0000000099e83fff]
[    0.011809]   node   0: [mem 0x0000000099e86000-0x0000000099ff9fff]
[    0.011809]   node   0: [mem 0x0000000099ffd000-0x0000000099ffffff]
[    0.011810]   node   0: [mem 0x0000000100000000-0x0000000fde2fffff]
[    0.011810] Initmem setup node 0 [mem 0x0000000000001000-0x0000000fde2f=
ffff]
[    0.012106] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.012127] On node 0, zone DMA: 96 pages in unavailable ranges
[    0.012318] On node 0, zone DMA32: 1537 pages in unavailable ranges
[    0.012337] On node 0, zone DMA32: 60 pages in unavailable ranges
[    0.014967] On node 0, zone DMA32: 33 pages in unavailable ranges
[    0.015108] On node 0, zone DMA32: 33747 pages in unavailable ranges
[    0.015138] On node 0, zone DMA32: 1 pages in unavailable ranges
[    0.015140] On node 0, zone DMA32: 2 pages in unavailable ranges
[    0.015140] On node 0, zone DMA32: 3 pages in unavailable ranges
[    0.095795] On node 0, zone Normal: 24576 pages in unavailable ranges
[    0.095827] On node 0, zone Normal: 7424 pages in unavailable ranges
[    0.095834] setup_percpu: NR_CPUS:64 nr_cpumask_bits:16 nr_cpu_ids:16 n=
r_node_ids:1
[    0.096029] percpu: Embedded 61 pages/cpu s212992 r8192 d28672 u262144
[    0.096033] pcpu-alloc: s212992 r8192 d28672 u262144 alloc=3D1*2097152
[    0.096034] pcpu-alloc: [0] 00 01 02 03 04 05 06 07 [0] 08 09 10 11 12 =
13 14 15=20
[    0.096046] Kernel command line:  dolvm crypt_root=3DLABEL=3Ddt8-luks r=
oot=3DLABEL=3Ddt8-root resume=3DLABEL=3Ddt8-swap thunderbolt.dyndbg=3D+p
[    0.096089] Unknown kernel command line parameters "dolvm crypt_root=3D=
LABEL=3Ddt8-luks", will be passed to user space.
[    0.096283] printk: log buffer data + meta data: 262144 + 917504 =3D 11=
79648 bytes
[    0.097022] Dentry cache hash table entries: 8388608 (order: 14, 671088=
64 bytes, linear)
[    0.097393] Inode-cache hash table entries: 4194304 (order: 13, 3355443=
2 bytes, linear)
[    0.097461] software IO TLB: area num 16.
[    0.098998] Built 1 zonelists, mobility grouping on.  Total pages: 1615=
2680
[    0.099000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.154290] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D16,=
 Nodes=3D1
[    0.154355] Dynamic Preempt: full
[    0.154408] rcu: Preemptible hierarchical RCU implementation.
[    0.154409] rcu: 	RCU restricting CPUs from NR_CPUS=3D64 to nr_cpu_ids=
=3D16.
[    0.154410] 	Trampoline variant of Tasks RCU enabled.
[    0.154410] 	Tracing variant of Tasks RCU enabled.
[    0.154410] rcu: RCU calculated value of scheduler-enlistment delay is =
10 jiffies.
[    0.154411] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_id=
s=3D16
[    0.154420] RCU Tasks: Setting shift to 4 and lim to 1 rcu_task_cb_adju=
st=3D1 rcu_task_cpu_ids=3D16.
[    0.162158] NR_IRQS: 4352, nr_irqs: 1096, preallocated irqs: 16
[    0.162357] rcu: srcu_init: Setting srcu_struct sizes based on contenti=
on.
[    0.162387] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffff=
ff, max_idle_ns: 19112604462750000 ns
[    0.162490] Console: colour dummy device 80x25
[    0.162492] printk: legacy console [tty0] enabled
[    0.162668] ACPI: Core revision 20260408
[    0.163070] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff,=
 max_idle_ns: 133484873504 ns
[    0.163091] APIC: Switch to symmetric I/O mode setup
[    0.163094] AMD-Vi: Force device table to maximum size
[    0.163314] AMD-Vi: ivrs, add hid:AMDI0020, uid:ID00, rdevid:0xa0
[    0.163316] AMD-Vi: ivrs, add hid:AMDI0020, uid:ID01, rdevid:0xa0
[    0.163318] AMD-Vi: ivrs, add hid:AMDI0020, uid:ID02, rdevid:0xa0
[    0.163319] AMD-Vi: ivrs, add hid:AMDI0020, uid:ID03, rdevid:0x98
[    0.163320] AMD-Vi: ivrs, add hid:AMDI0020, uid:ID04, rdevid:0x98
[    0.163321] AMD-Vi: Using global IVHD EFR:0x246577efa2254afa, EFR2:0x0
[    0.164691] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=
=3D-1
[    0.213094] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles=
: 0x3c8b254c8a6, max_idle_ns: 440795331704 ns
[    0.213100] Calibrating delay loop (skipped), value calculated using ti=
mer frequency.. 8400.41 BogoMIPS (lpj=3D42002070)
[    0.213122] x86/cpu: User Mode Instruction Prevention (UMIP) activated
[    0.213149] LVT offset 1 assigned for vector 0xf9
[    0.213151] LVT offset 2 assigned for vector 0xf4
[    0.213338] Last level iTLB entries: 4KB 512, 2MB 512, 4MB 256
[    0.213339] Last level dTLB entries: 4KB 3072, 2MB 3072, 4MB 1536, 1GB =
0
[    0.213343] process: using mwait in idle threads
[    0.213345] mitigations: Enabled attack vectors: user_kernel, user_user=
, guest_host, guest_guest, SMT mitigations: auto
[    0.213349] Speculative Store Bypass: Mitigation: Speculative Store Byp=
ass disabled via prctl
[    0.213352] Transient Scheduler Attacks: Mitigation: Clear CPU buffers
[    0.213353] Spectre V2 : Mitigation: Enhanced / Automatic IBRS
[    0.213354] Spectre V2 : User space: Mitigation: STIBP always-on protec=
tion
[    0.213356] Speculative Return Stack Overflow: Mitigation: Safe RET
[    0.213357] VMSCAPE: Mitigation: IBPB before exit to userspace
[    0.213358] Spectre V1 : Mitigation: usercopy/swapgs barriers and __use=
r pointer sanitization
[    0.213361] Spectre V2 : mitigation: Enabling conditional Indirect Bran=
ch Prediction Barrier
[    0.213364] active return thunk: srso_alias_return_thunk
[    0.213375] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating poin=
t registers'
[    0.213377] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.213378] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.213379] x86/fpu: Supporting XSAVE feature 0x020: 'AVX-512 opmask'
[    0.213380] x86/fpu: Supporting XSAVE feature 0x040: 'AVX-512 Hi256'
[    0.213381] x86/fpu: Supporting XSAVE feature 0x080: 'AVX-512 ZMM_Hi256=
'
[    0.213382] x86/fpu: Supporting XSAVE feature 0x200: 'Protection Keys U=
ser registers'
[    0.213384] x86/fpu: Supporting XSAVE feature 0x800: 'Control-flow User=
 registers'
[    0.213385] x86/fpu: Supporting XSAVE feature 0x1000: 'Control-flow Ker=
nel registers (KVM only)'
[    0.213387] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.213388] x86/fpu: xstate_offset[5]:  832, xstate_sizes[5]:   64
[    0.213389] x86/fpu: xstate_offset[6]:  896, xstate_sizes[6]:  512
[    0.213390] x86/fpu: xstate_offset[7]: 1408, xstate_sizes[7]: 1024
[    0.213392] x86/fpu: xstate_offset[9]: 2432, xstate_sizes[9]:    8
[    0.213393] x86/fpu: xstate_offset[11]: 2440, xstate_sizes[11]:   16
[    0.213394] x86/fpu: xstate_offset[12]: 2456, xstate_sizes[12]:   24
[    0.213395] x86/fpu: Enabled xstate features 0x1ae7, context size is 24=
80 bytes, using 'compacted' format.
[    0.242259] pid_max: default: 32768 minimum: 301
[    0.242355] VFS: Disk quotas dquot_6.6.0
[    0.242360] VFS: Dquot-cache hash table entries: 512 (4096 bytes)
[    0.242400] Mount-cache hash table entries: 131072 (order: 8, 1048576 b=
ytes, linear)
[    0.242432] Mountpoint-cache hash table entries: 131072 (order: 8, 1048=
576 bytes, linear)
[    0.242510] VFS: Finished mounting rootfs on nullfs
[    0.362902] smpboot: CPU0: AMD Ryzen 7 8700G w/ Radeon 780M Graphics (f=
amily: 0x19, model: 0x75, stepping: 0x2)
[    0.363097] Performance Events: Fam17h+ 16-deep LBR, core perfctr, AMD =
PMU driver.
[    0.363097] ... version:                   2
[    0.363097] ... bit width:                 48
[    0.363097] ... generic counters:          6
[    0.363097] ... generic bitmap:            000000000000003f
[    0.363097] ... fixed-purpose counters:    0
[    0.363097] ... fixed-purpose bitmap:      0000000000000000
[    0.363097] ... value mask:                0000ffffffffffff
[    0.363097] ... max period:                00007fffffffffff
[    0.363097] ... global_ctrl mask:          000000000000003f
[    0.363097] signal: max sigframe size: 3376
[    0.363097] rcu: Hierarchical SRCU implementation.
[    0.363097] rcu: 	Max phase no-delay instances is 1000.
[    0.363097] Timer migration: 2 hierarchy levels; 8 children per group; =
2 crossnode level
[    0.363097] smp: Bringing up secondary CPUs ...
[    0.363097] smpboot: x86: Booting SMP configuration:
[    0.363097] .... node  #0, CPUs:        #1  #2  #3  #4  #5  #6  #7  #8 =
 #9 #10 #11 #12 #13 #14 #15
[    0.375099] Spectre V2 : Update user space SMT mitigation: STIBP always=
-on
[    0.385099] smp: Brought up 1 node, 16 CPUs
[    0.385099] smpboot: Total of 16 processors activated (134406.62 BogoMI=
PS)
[    0.385099] Memory: 63207844K/64610720K available (25374K kernel code, =
4191K rwdata, 16228K rodata, 20948K init, 3448K bss, 1389556K reserved, 0K=
 cma-reserved)
[    0.385099] devtmpfs: initialized
[    0.385099] x86/mm: Memory block size: 128MB
[    0.400674] ACPI: PM: Registering ACPI NVS region [mem 0x0a200000-0x0a2=
3bfff] (245760 bytes)
[    0.400674] ACPI: PM: Registering ACPI NVS region [mem 0x95dac000-0x97d=
abfff] (33554432 bytes)
[    0.400674] ACPI: PM: Registering ACPI NVS region [mem 0x988ba000-0x988=
bafff] (4096 bytes)
[    0.400674] ACPI: PM: Registering ACPI NVS region [mem 0x99e84000-0x99e=
85fff] (8192 bytes)
[    0.400674] posixtimers hash table entries: 8192 (order: 5, 131072 byte=
s, linear)
[    0.400674] futex hash table entries: 4096 (262144 bytes on 1 NUMA node=
s, total 256 KiB, linear).
[    0.400674] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.400674] DMA: preallocated 4096 KiB GFP_KERNEL pool for atomic alloc=
ations
[    0.400674] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA pool for atom=
ic allocations
[    0.400674] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA32 pool for at=
omic allocations
[    0.400674] audit: initializing netlink subsys (disabled)
[    0.400674] audit: type=3D2000 audit(1795714798.230:1): state=3Dinitial=
ized audit_enabled=3D0 res=3D1
[    0.400674] thermal_sys: Registered thermal governor 'bang_bang'
[    0.400674] thermal_sys: Registered thermal governor 'step_wise'
[    0.400674] thermal_sys: Registered thermal governor 'user_space'
[    0.400674] thermal_sys: Registered thermal governor 'power_allocator'
[    0.400674] cpuidle: using governor ladder
[    0.400674] cpuidle: using governor menu
[    0.410259] efi: Freeing EFI boot services memory: 126160K
[    0.410265] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.410353] PCI: ECAM [mem 0xe0000000-0xefffffff] (base 0xe0000000) for=
 domain 0000 [bus 00-ff]
[    0.410370] PCI: Using configuration type 1 for base access
[    0.410451] ACPI: Added _OSI(Module Device)
[    0.410451] ACPI: Added _OSI(Processor Device)
[    0.410451] ACPI: Added _OSI(Processor Aggregator Device)
[    0.449137] ACPI: 18 ACPI AML tables successfully acquired and loaded
[    0.636374] ACPI: \_SB_: platform _OSC: OS support mask [006e7eff]
[    0.636374] ACPI: \_SB_: platform _OSC: OS control mask [006e7eff]
[    0.639405] ACPI: USB4 _OSC: OS supports USB3+ DisplayPort+ PCIe+ XDoma=
in+
[    0.639409] ACPI: USB4 _OSC: OS controls USB3+ DisplayPort+ PCIe+ XDoma=
in+
[    0.644775] ACPI: Interpreter enabled
[    0.644946] ACPI: PM: (supports S0 S3 S4 S5)
[    0.644949] ACPI: Using IOAPIC for interrupt routing
[    0.867157] PCI: Using host bridge windows from ACPI; if necessary, use=
 "pci=3Dnocrs" and report a bug
[    0.867162] PCI: Ignoring E820 reservations for host bridge windows
[    0.867958] ACPI: Enabled 10 GPEs in block 00 to 1F
[    0.871442] ACPI: \_SB_.PCI0.GP11.PWRS: New power resource
[    0.872532] ACPI: \_SB_.PCI0.GP11.SWUS.PWRS: New power resource
[    0.873768] ACPI: \_SB_.PCI0.GP12.PWRS: New power resource
[    0.874839] ACPI: \_SB_.PCI0.GP12.SWUS.PWRS: New power resource
[    0.876676] ACPI: \_SB_.PCI0.GP17.XHC0.P0U0: New power resource
[    0.879112] ACPI: \_SB_.PCI0.GP17.XHC1.P0U1: New power resource
[    0.882344] ACPI: \_SB_.PCI0.GP19.XHC3.PWRS: New power resource
[    0.884423] ACPI: \_SB_.PCI0.GP19.XHC4.PWRS: New power resource
[    0.886499] ACPI: \_SB_.PCI0.GP19.NHI0.PWRS: New power resource
[    0.887600] ACPI: \_SB_.PCI0.GP19.NHI1.PWRS: New power resource
[    0.888232] ACPI: \_SB_.PCI0.GPP1.P0NV: New power resource
[    0.888700] ACPI: \_SB_.PCI0.GPP5.PWRS: New power resource
[    0.889216] ACPI: \_SB_.PCI0.GPP5.UP00.PWRS: New power resource
[    0.889684] ACPI: \_SB_.PCI0.GPP5.UP00.DP00.PWRS: New power resource
[    0.890761] ACPI: \_SB_.PCI0.GPP5.UP00.DP08.PWRS: New power resource
[    0.891152] ACPI: \_SB_.PCI0.GPP5.UP00.DP08.EP00.PWRS: New power resour=
ce
[    0.891587] ACPI: \_SB_.PCI0.GPP5.UP00.DP10.PWRS: New power resource
[    0.892052] ACPI: \_SB_.PCI0.GPP5.UP00.DP10.WN00.PWRS: New power resour=
ce
[    0.892525] ACPI: \_SB_.PCI0.GPP5.UP00.DP18.PWRS: New power resource
[    0.892991] ACPI: \_SB_.PCI0.GPP5.UP00.DP18.LN00.PWRS: New power resour=
ce
[    0.893644] ACPI: \_SB_.PCI0.GPP5.UP00.DP20.PWRS: New power resource
[    0.894722] ACPI: \_SB_.PCI0.GPP5.UP00.DP28.PWRS: New power resource
[    0.895504] ACPI: \_SB_.PCI0.GPP5.UP00.DP28.EP00.PWRS: New power resour=
ce
[    0.895976] ACPI: \_SB_.PCI0.GPP5.UP00.DP30.PWRS: New power resource
[    0.896761] ACPI: \_SB_.PCI0.GPP5.UP00.DP30.EP00.PWRS: New power resour=
ce
[    0.897231] ACPI: \_SB_.PCI0.GPP5.UP00.DP38.PWRS: New power resource
[    0.898009] ACPI: \_SB_.PCI0.GPP5.UP00.DP38.EP00.PWRS: New power resour=
ce
[    0.898487] ACPI: \_SB_.PCI0.GPP5.UP00.DP40.PWRS: New power resource
[    0.899265] ACPI: \_SB_.PCI0.GPP5.UP00.DP40.EP00.PWRS: New power resour=
ce
[    0.899740] ACPI: \_SB_.PCI0.GPP5.UP00.DP48.PWRS: New power resource
[    0.900134] ACPI: \_SB_.PCI0.GPP5.UP00.DP48.EP00.PWRS: New power resour=
ce
[    0.900565] ACPI: \_SB_.PCI0.GPP5.UP00.DP50.PWRS: New power resource
[    0.900957] ACPI: \_SB_.PCI0.GPP5.UP00.DP50.EP00.PWRS: New power resour=
ce
[    0.901387] ACPI: \_SB_.PCI0.GPP5.UP00.DP58.PWRS: New power resource
[    0.901778] ACPI: \_SB_.PCI0.GPP5.UP00.DP58.EP00.PWRS: New power resour=
ce
[    0.902211] ACPI: \_SB_.PCI0.GPP5.UP00.DP60.PWRS: New power resource
[    0.902674] ACPI: \_SB_.PCI0.GPP5.UP00.DP60.XH00.PWRS: New power resour=
ce
[    0.911029] ACPI: \_SB_.PCI0.GPP5.UP00.DP68.PWRS: New power resource
[    0.911489] ACPI: \_SB_.PCI0.GPP5.UP00.DP68.SA00.PWRS: New power resour=
ce
[    0.913088] ACPI: \_SB_.PCI0.GPP6.PWRS: New power resource
[    0.914593] ACPI: \_SB_.PCI0.GPP6.U4UP.PWRS: New power resource
[    0.915556] ACPI: \_SB_.PCI0.GPP6.U4UP.U4P0.PWRS: New power resource
[    0.916434] ACPI: \_SB_.PCI0.GPP6.U4UP.U4P0.UP0D.PWRS: New power resour=
ce
[    0.917877] ACPI: \_SB_.PCI0.GPP6.U4UP.U4P1.PWRS: New power resource
[    0.919007] ACPI: \_SB_.PCI0.GPP6.U4UP.U4P1.UP1D.PWRS: New power resour=
ce
[    0.919948] ACPI: \_SB_.PCI0.GPP6.U4UP.U4P2.PWRS: New power resource
[    0.920821] ACPI: \_SB_.PCI0.GPP6.U4UP.U4P2.UXHC.PWRS: New power resour=
ce
[    0.923831] ACPI: \_SB_.PCI0.GPP6.U4UP.U4P3.PWRS: New power resource
[    0.924715] ACPI: \_SB_.PCI0.GPP6.U4UP.U4P3.UHI0.PWRS: New power resour=
ce
[    0.933329] ACPI: \_SB_.PRWL: New power resource
[    0.933368] ACPI: \_SB_.PRWB: New power resource
[    0.935119] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.935127] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM Clo=
ckPM Segments MSI EDR HPX-Type3]
[    0.935370] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug SHPCHot=
plug PME AER PCIeCapability LTR DPC]
[    0.936443] PCI host bridge to bus 0000:00
[    0.936449] pci_bus 0000:00: root bus resource [io  0x0000-0x03af windo=
w]
[    0.936453] pci_bus 0000:00: root bus resource [io  0x03e0-0x0cf7 windo=
w]
[    0.936457] pci_bus 0000:00: root bus resource [io  0x03b0-0x03df windo=
w]
[    0.936460] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff windo=
w]
[    0.936464] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000dff=
ff window]
[    0.936468] pci_bus 0000:00: root bus resource [mem 0xf2000000-0xf6ffff=
ff window]
[    0.936472] pci_bus 0000:00: root bus resource [mem 0xf0000000-0xf1ffff=
ff window]
[    0.936476] pci_bus 0000:00: root bus resource [mem 0xa0000000-0xdfffff=
ff window]
[    0.936479] pci_bus 0000:00: root bus resource [mem 0x1060000000-0xfcff=
ffffff window]
[    0.936484] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.936487] acpi PNP0A08:00: OS native features: SHPCHotplug+ PCIeHotpl=
ug+ PME+ AER+ DPC+ LTR+
[    0.959886] pci 0000:00:00.0: [1022:14e8] type 00 class 0x060000 conven=
tional PCI endpoint
[    0.960039] pci 0000:00:00.2: [1022:14e9] type 00 class 0x080600 conven=
tional PCI endpoint
[    0.960177] pci 0000:00:01.0: [1022:14ea] type 00 class 0x060000 conven=
tional PCI endpoint
[    0.960312] pci 0000:00:01.2: [1022:14ed] type 01 class 0x060400 PCIe R=
oot Port
[    0.960329] pci 0000:00:01.2: PCI bridge to [bus 01]
[    0.960336] pci 0000:00:01.2:   bridge window [mem 0xddb00000-0xddbffff=
f]
[    0.960414] pci 0000:00:01.2: PME# supported from D0 D3hot D3cold
[    0.960613] pci 0000:00:02.0: [1022:14ea] type 00 class 0x060000 conven=
tional PCI endpoint
[    0.960777] pci 0000:00:02.1: [1022:14ee] type 01 class 0x060400 PCIe R=
oot Port
[    0.960799] pci 0000:00:02.1: PCI bridge to [bus 02-0d]
[    0.960806] pci 0000:00:02.1:   bridge window [io  0xf000-0xffff]
[    0.960811] pci 0000:00:02.1:   bridge window [mem 0xdca00000-0xdd0ffff=
f]
[    0.960913] pci 0000:00:02.1: PME# supported from D0 D3hot D3cold
[    0.962916] pci 0000:00:02.2: [1022:14ee] type 01 class 0x060400 PCIe R=
oot Port
[    0.962936] pci 0000:00:02.2: PCI bridge to [bus 0e-71]
[    0.962942] pci 0000:00:02.2:   bridge window [io  0x8000-0xdfff]
[    0.962947] pci 0000:00:02.2:   bridge window [mem 0xac000000-0xdc7ffff=
f]
[    0.962956] pci 0000:00:02.2:   bridge window [mem 0xb800000000-0xf7fff=
fffff 64bit pref]
[    0.963038] pci 0000:00:02.2: PME# supported from D0 D3hot D3cold
[    0.987459] pci 0000:00:03.0: [1022:14ea] type 00 class 0x060000 conven=
tional PCI endpoint
[    0.987596] pci 0000:00:04.0: [1022:14ea] type 00 class 0x060000 conven=
tional PCI endpoint
[    0.987729] pci 0000:00:08.0: [1022:14ea] type 00 class 0x060000 conven=
tional PCI endpoint
[    0.987853] pci 0000:00:08.1: [1022:14eb] type 01 class 0x060400 PCIe R=
oot Port
[    0.987870] pci 0000:00:08.1: PCI bridge to [bus 72]
[    0.987875] pci 0000:00:08.1:   bridge window [io  0xe000-0xefff]
[    0.987880] pci 0000:00:08.1:   bridge window [mem 0xdd200000-0xdd7ffff=
f]
[    0.987888] pci 0000:00:08.1:   bridge window [mem 0xf800000000-0xf80ff=
fffff 64bit pref]
[    0.987897] pci 0000:00:08.1: enabling Extended Tags
[    0.987938] pci 0000:00:08.1: PME# supported from D0 D3hot D3cold
[    0.989051] pci 0000:00:08.2: [1022:14eb] type 01 class 0x060400 PCIe R=
oot Port
[    0.989084] pci 0000:00:08.2: PCI bridge to [bus 73]
[    0.989091] pci 0000:00:08.2:   bridge window [mem 0xdda00000-0xddaffff=
f]
[    0.989099] pci 0000:00:08.2:   bridge window [mem 0xf810000000-0xf8100=
fffff 64bit pref]
[    0.989108] pci 0000:00:08.2: enabling Extended Tags
[    0.989149] pci 0000:00:08.2: PME# supported from D0 D3hot D3cold
[    0.989297] pci 0000:00:08.3: [1022:14eb] type 01 class 0x060400 PCIe R=
oot Port
[    0.989314] pci 0000:00:08.3: PCI bridge to [bus 74]
[    0.989320] pci 0000:00:08.3:   bridge window [mem 0xdd800000-0xdd9ffff=
f]
[    0.989333] pci 0000:00:08.3: enabling Extended Tags
[    0.989374] pci 0000:00:08.3: PME# supported from D0 D3hot D3cold
[    0.989557] pci 0000:00:14.0: [1022:790b] type 00 class 0x0c0500 conven=
tional PCI endpoint
[    0.989716] pci 0000:00:14.3: [1022:790e] type 00 class 0x060100 conven=
tional PCI endpoint
[    0.989886] pci 0000:00:18.0: [1022:14f0] type 00 class 0x060000 conven=
tional PCI endpoint
[    0.989939] pci 0000:00:18.1: [1022:14f1] type 00 class 0x060000 conven=
tional PCI endpoint
[    0.989991] pci 0000:00:18.2: [1022:14f2] type 00 class 0x060000 conven=
tional PCI endpoint
[    0.990043] pci 0000:00:18.3: [1022:14f3] type 00 class 0x060000 conven=
tional PCI endpoint
[    0.990093] pci 0000:00:18.4: [1022:14f4] type 00 class 0x060000 conven=
tional PCI endpoint
[    0.990147] pci 0000:00:18.5: [1022:14f5] type 00 class 0x060000 conven=
tional PCI endpoint
[    0.990199] pci 0000:00:18.6: [1022:14f6] type 00 class 0x060000 conven=
tional PCI endpoint
[    0.990249] pci 0000:00:18.7: [1022:14f7] type 00 class 0x060000 conven=
tional PCI endpoint
[    0.990409] pci 0000:01:00.0: [144d:a80a] type 00 class 0x010802 PCIe E=
ndpoint
[    0.990445] pci 0000:01:00.0: BAR 0 [mem 0xddb00000-0xddb03fff 64bit]
[    0.990722] pci 0000:00:01.2: PCI bridge to [bus 01]
[    0.990856] pci 0000:02:00.0: [1022:43f4] type 01 class 0x060400 PCIe S=
witch Upstream Port
[    0.990884] pci 0000:02:00.0: PCI bridge to [bus 03-0d]
[    0.990891] pci 0000:02:00.0:   bridge window [io  0xf000-0xffff]
[    0.990896] pci 0000:02:00.0:   bridge window [mem 0xdca00000-0xdd0ffff=
f]
[    0.990919] pci 0000:02:00.0: enabling Extended Tags
[    0.990991] pci 0000:02:00.0: PME# supported from D0 D3hot D3cold
[    0.993809] pci 0000:00:02.1: PCI bridge to [bus 02-0d]
[    0.994048] pci 0000:03:00.0: [1022:43f5] type 01 class 0x060400 PCIe S=
witch Downstream Port
[    0.994075] pci 0000:03:00.0: PCI bridge to [bus 04]
[    0.994105] pci 0000:03:00.0: enabling Extended Tags
[    0.994184] pci 0000:03:00.0: PME# supported from D0 D3hot D3cold
[    0.994451] pci 0000:03:02.0: [1022:43f5] type 01 class 0x060400 PCIe S=
witch Downstream Port
[    0.994479] pci 0000:03:02.0: PCI bridge to [bus 05]
[    0.994486] pci 0000:03:02.0:   bridge window [io  0xf000-0xffff]
[    0.994492] pci 0000:03:02.0:   bridge window [mem 0xdd000000-0xdd0ffff=
f]
[    0.994515] pci 0000:03:02.0: enabling Extended Tags
[    0.994590] pci 0000:03:02.0: PME# supported from D0 D3hot D3cold
[    0.996532] pci 0000:03:03.0: [1022:43f5] type 01 class 0x060400 PCIe S=
witch Downstream Port
[    0.996560] pci 0000:03:03.0: PCI bridge to [bus 06]
[    0.996570] pci 0000:03:03.0:   bridge window [mem 0xdca00000-0xdccffff=
f]
[    0.996594] pci 0000:03:03.0: enabling Extended Tags
[    0.996669] pci 0000:03:03.0: PME# supported from D0 D3hot D3cold
[    0.998606] pci 0000:03:04.0: [1022:43f5] type 01 class 0x060400 PCIe S=
witch Downstream Port
[    0.998634] pci 0000:03:04.0: PCI bridge to [bus 07]
[    0.998664] pci 0000:03:04.0: enabling Extended Tags
[    0.998742] pci 0000:03:04.0: PME# supported from D0 D3hot D3cold
[    0.998990] pci 0000:03:05.0: [1022:43f5] type 01 class 0x060400 PCIe S=
witch Downstream Port
[    0.999018] pci 0000:03:05.0: PCI bridge to [bus 08]
[    0.999048] pci 0000:03:05.0: enabling Extended Tags
[    0.999125] pci 0000:03:05.0: PME# supported from D0 D3hot D3cold
[    0.999372] pci 0000:03:06.0: [1022:43f5] type 01 class 0x060400 PCIe S=
witch Downstream Port
[    0.999400] pci 0000:03:06.0: PCI bridge to [bus 09]
[    0.999429] pci 0000:03:06.0: enabling Extended Tags
[    0.999507] pci 0000:03:06.0: PME# supported from D0 D3hot D3cold
[    0.999756] pci 0000:03:07.0: [1022:43f5] type 01 class 0x060400 PCIe S=
witch Downstream Port
[    0.999784] pci 0000:03:07.0: PCI bridge to [bus 0a]
[    0.999813] pci 0000:03:07.0: enabling Extended Tags
[    0.999891] pci 0000:03:07.0: PME# supported from D0 D3hot D3cold
[    1.000141] pci 0000:03:08.0: [1022:43f5] type 01 class 0x060400 PCIe S=
witch Downstream Port
[    1.000169] pci 0000:03:08.0: PCI bridge to [bus 0b]
[    1.000198] pci 0000:03:08.0: enabling Extended Tags
[    1.000276] pci 0000:03:08.0: PME# supported from D0 D3hot D3cold
[    1.000527] pci 0000:03:0c.0: [1022:43f5] type 01 class 0x060400 PCIe S=
witch Downstream Port
[    1.000554] pci 0000:03:0c.0: PCI bridge to [bus 0c]
[    1.000562] pci 0000:03:0c.0:   bridge window [mem 0xdcf00000-0xdcfffff=
f]
[    1.000585] pci 0000:03:0c.0: enabling Extended Tags
[    1.000637] pci 0000:03:0c.0: PME# supported from D0 D3hot D3cold
[    1.002562] pci 0000:03:0d.0: [1022:43f5] type 01 class 0x060400 PCIe S=
witch Downstream Port
[    1.002590] pci 0000:03:0d.0: PCI bridge to [bus 0d]
[    1.002597] pci 0000:03:0d.0:   bridge window [mem 0xdce00000-0xdceffff=
f]
[    1.002620] pci 0000:03:0d.0: enabling Extended Tags
[    1.002673] pci 0000:03:0d.0: PME# supported from D0 D3hot D3cold
[    1.004476] pci 0000:02:00.0: PCI bridge to [bus 03-0d]
[    1.004554] pci 0000:03:00.0: PCI bridge to [bus 04]
[    1.004688] pci 0000:05:00.0: [10ec:8125] type 00 class 0x020000 PCIe E=
ndpoint
[    1.004758] pci 0000:05:00.0: BAR 0 [io  0xf000-0xf0ff]
[    1.004767] pci 0000:05:00.0: BAR 2 [mem 0xdd000000-0xdd00ffff 64bit]
[    1.004774] pci 0000:05:00.0: BAR 4 [mem 0xdd010000-0xdd013fff 64bit]
[    1.004931] pci 0000:05:00.0: supports D1 D2
[    1.004934] pci 0000:05:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    1.023180] pci 0000:03:02.0: PCI bridge to [bus 05]
[    1.023433] pci 0000:06:00.0: [14c3:7925] type 00 class 0x028000 PCIe E=
ndpoint
[    1.023517] pci 0000:06:00.0: BAR 0 [mem 0xdca00000-0xdcbfffff 64bit]
[    1.023527] pci 0000:06:00.0: BAR 2 [mem 0xdcc00000-0xdcc07fff 64bit]
[    1.023694] pci 0000:06:00.0: PME# supported from D0 D3hot D3cold
[    1.043164] pci 0000:03:03.0: PCI bridge to [bus 06]
[    1.043284] pci 0000:03:04.0: PCI bridge to [bus 07]
[    1.043395] pci 0000:03:05.0: PCI bridge to [bus 08]
[    1.043510] pci 0000:03:06.0: PCI bridge to [bus 09]
[    1.043621] pci 0000:03:07.0: PCI bridge to [bus 0a]
[    1.043732] pci 0000:03:08.0: PCI bridge to [bus 0b]
[    1.043871] pci 0000:0c:00.0: [1022:43fc] type 00 class 0x0c0330 PCIe L=
egacy Endpoint
[    1.043923] pci 0000:0c:00.0: BAR 0 [mem 0xdcf00000-0xdcf07fff 64bit]
[    1.043942] pci 0000:0c:00.0: enabling Extended Tags
[    1.044023] pci 0000:0c:00.0: PME# supported from D0 D3hot D3cold
[    1.045573] pci 0000:03:0c.0: PCI bridge to [bus 0c]
[    1.045689] pci 0000:0d:00.0: [1022:43f6] type 00 class 0x010601 PCIe L=
egacy Endpoint
[    1.045739] pci 0000:0d:00.0: BAR 5 [mem 0xdce80000-0xdce803ff]
[    1.045743] pci 0000:0d:00.0: ROM [mem 0xdce00000-0xdce7ffff pref]
[    1.045753] pci 0000:0d:00.0: enabling Extended Tags
[    1.045811] pci 0000:0d:00.0: PME# supported from D0 D3hot D3cold
[    1.047059] pci 0000:03:0d.0: PCI bridge to [bus 0d]
[    1.047283] pci 0000:0e:00.0: [1b21:2421] type 01 class 0x060400 PCIe S=
witch Upstream Port
[    1.047314] pci 0000:0e:00.0: PCI bridge to [bus 0f-71]
[    1.047323] pci 0000:0e:00.0:   bridge window [io  0x8000-0xdfff]
[    1.047328] pci 0000:0e:00.0:   bridge window [mem 0xac000000-0xdc7ffff=
f]
[    1.047341] pci 0000:0e:00.0:   bridge window [mem 0xb800000000-0xf7fff=
fffff 64bit pref]
[    1.047440] pci 0000:0e:00.0: PME# supported from D0 D3hot D3cold
[    1.112316] pci 0000:00:02.2: PCI bridge to [bus 0e-71]
[    1.112545] pci 0000:0f:00.0: [1b21:2423] type 01 class 0x060400 PCIe S=
witch Downstream Port
[    1.112576] pci 0000:0f:00.0: PCI bridge to [bus 10-3f]
[    1.112585] pci 0000:0f:00.0:   bridge window [io  0xb000-0xdfff]
[    1.112590] pci 0000:0f:00.0:   bridge window [mem 0xc4000000-0xdbfffff=
f]
[    1.112603] pci 0000:0f:00.0:   bridge window [mem 0xd800000000-0xf7fff=
fffff 64bit pref]
[    1.112824] pci 0000:0f:00.0: PME# supported from D0 D3hot D3cold
[    1.134811] pci 0000:0f:01.0: [1b21:2423] type 01 class 0x060400 PCIe S=
witch Downstream Port
[    1.134839] pci 0000:0f:01.0: PCI bridge to [bus 40-6f]
[    1.134847] pci 0000:0f:01.0:   bridge window [io  0x8000-0xafff]
[    1.134852] pci 0000:0f:01.0:   bridge window [mem 0xac000000-0xc3fffff=
f]
[    1.134864] pci 0000:0f:01.0:   bridge window [mem 0xb800000000-0xd7fff=
fffff 64bit pref]
[    1.135073] pci 0000:0f:01.0: PME# supported from D0 D3hot D3cold
[    1.147133] pci 0000:0f:02.0: [1b21:2423] type 01 class 0x060400 PCIe S=
witch Downstream Port
[    1.147161] pci 0000:0f:02.0: PCI bridge to [bus 70]
[    1.147169] pci 0000:0f:02.0:   bridge window [mem 0xdc400000-0xdc7ffff=
f]
[    1.147252] pci 0000:0f:02.0: PME# supported from D0 D3hot D3cold
[    1.171731] pci 0000:0f:03.0: [1b21:2423] type 01 class 0x060400 PCIe S=
witch Downstream Port
[    1.171760] pci 0000:0f:03.0: PCI bridge to [bus 71]
[    1.171768] pci 0000:0f:03.0:   bridge window [mem 0xdc000000-0xdc3ffff=
f]
[    1.171851] pci 0000:0f:03.0: PME# supported from D0 D3hot D3cold
[    1.196501] pci 0000:0e:00.0: PCI bridge to [bus 0f-71]
[    1.196773] pci 0000:10:00.0: [8086:0b26] type 01 class 0x060400 PCIe S=
witch Upstream Port
[    1.196826] pci 0000:10:00.0: PCI bridge to [bus 11-16]
[    1.197075] pci 0000:10:00.0: supports D1 D2
[    1.197078] pci 0000:10:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    1.208169] pci 0000:10:00.0: 2.000 Gb/s available PCIe bandwidth, limi=
ted by 2.5 GT/s PCIe x1 link at 0000:0f:00.0 (capable of 8.000 Gb/s with 2=
.5 GT/s PCIe x4 link)
[    1.208354] pci 0000:0f:00.0: PCI bridge to [bus 10-3f]
[    1.208548] pci 0000:11:00.0: [8086:0b26] type 01 class 0x060400 PCIe S=
witch Downstream Port
[    1.208602] pci 0000:11:00.0: PCI bridge to [bus 12]
[    1.208862] pci 0000:11:00.0: supports D1 D2
[    1.208865] pci 0000:11:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    1.209337] pci 0000:11:01.0: [8086:0b26] type 01 class 0x060400 PCIe S=
witch Downstream Port
[    1.209391] pci 0000:11:01.0: PCI bridge to [bus 13]
[    1.209650] pci 0000:11:01.0: supports D1 D2
[    1.209653] pci 0000:11:01.0: PME# supported from D0 D1 D2 D3hot D3cold
[    1.210123] pci 0000:11:02.0: [8086:0b26] type 01 class 0x060400 PCIe S=
witch Downstream Port
[    1.210177] pci 0000:11:02.0: PCI bridge to [bus 14]
[    1.210435] pci 0000:11:02.0: supports D1 D2
[    1.210438] pci 0000:11:02.0: PME# supported from D0 D1 D2 D3hot D3cold
[    1.210911] pci 0000:11:03.0: [8086:0b26] type 01 class 0x060400 PCIe S=
witch Downstream Port
[    1.210965] pci 0000:11:03.0: PCI bridge to [bus 15]
[    1.211224] pci 0000:11:03.0: supports D1 D2
[    1.211227] pci 0000:11:03.0: PME# supported from D0 D1 D2 D3hot D3cold
[    1.211699] pci 0000:11:04.0: [8086:0b26] type 01 class 0x060400 PCIe S=
witch Downstream Port
[    1.211753] pci 0000:11:04.0: PCI bridge to [bus 16]
[    1.212017] pci 0000:11:04.0: supports D1 D2
[    1.212020] pci 0000:11:04.0: PME# supported from D0 D1 D2 D3hot D3cold
[    1.212442] pci 0000:10:00.0: PCI bridge to [bus 11-16]
[    1.212536] pci 0000:11:00.0: PCI bridge to [bus 12]
[    1.212635] pci 0000:11:01.0: PCI bridge to [bus 13]
[    1.212732] pci 0000:11:02.0: PCI bridge to [bus 14]
[    1.212829] pci 0000:11:03.0: PCI bridge to [bus 15]
[    1.212928] pci 0000:11:04.0: PCI bridge to [bus 16]
[    1.213355] pci 0000:0f:01.0: PCI bridge to [bus 40-6f]
[    1.213471] pci 0000:70:00.0: [1b21:2426] type 00 class 0x0c0330 PCIe L=
egacy Endpoint
[    1.213511] pci 0000:70:00.0: BAR 0 [mem 0xdc400000-0xdc407fff 64bit]
[    1.213584] pci 0000:70:00.0: PME# supported from D0 D3hot D3cold
[    1.224509] pci 0000:0f:02.0: PCI bridge to [bus 70]
[    1.224669] pci 0000:71:00.0: [1b21:2425] type 00 class 0x0c0340 PCIe L=
egacy Endpoint
[    1.224707] pci 0000:71:00.0: BAR 0 [mem 0xdc000000-0xdc03ffff 64bit]
[    1.224713] pci 0000:71:00.0: BAR 2 [mem 0xdc040000-0xdc04ffff 64bit]
[    1.224785] pci 0000:71:00.0: PME# supported from D0 D3hot D3cold
[    1.236324] pci 0000:0f:03.0: PCI bridge to [bus 71]
[    1.236500] pci 0000:72:00.0: [1002:15bf] type 00 class 0x030000 PCIe L=
egacy Endpoint
[    1.236531] pci 0000:72:00.0: BAR 0 [mem 0xf800000000-0xf80fffffff 64bi=
t pref]
[    1.236536] pci 0000:72:00.0: BAR 2 [mem 0xdd200000-0xdd3fffff 64bit pr=
ef]
[    1.236540] pci 0000:72:00.0: BAR 4 [io  0xe000-0xe0ff]
[    1.236544] pci 0000:72:00.0: BAR 5 [mem 0xdd700000-0xdd77ffff]
[    1.236552] pci 0000:72:00.0: enabling Extended Tags
[    1.236635] pci 0000:72:00.0: PME# supported from D1 D2 D3hot D3cold
[    1.236864] pci 0000:72:00.1: [1002:1640] type 00 class 0x040300 PCIe L=
egacy Endpoint
[    1.236896] pci 0000:72:00.1: BAR 0 [mem 0xdd788000-0xdd78bfff]
[    1.236909] pci 0000:72:00.1: enabling Extended Tags
[    1.236960] pci 0000:72:00.1: PME# supported from D1 D2 D3hot D3cold
[    1.237111] pci 0000:72:00.2: [1022:15c7] type 00 class 0x108000 PCIe E=
ndpoint
[    1.237146] pci 0000:72:00.2: BAR 2 [mem 0xdd600000-0xdd6fffff]
[    1.237151] pci 0000:72:00.2: BAR 5 [mem 0xdd78c000-0xdd78dfff]
[    1.237160] pci 0000:72:00.2: enabling Extended Tags
[    1.237311] pci 0000:72:00.3: [1022:15b9] type 00 class 0x0c0330 PCIe E=
ndpoint
[    1.237345] pci 0000:72:00.3: BAR 0 [mem 0xdd500000-0xdd5fffff 64bit]
[    1.237358] pci 0000:72:00.3: enabling Extended Tags
[    1.237411] pci 0000:72:00.3: PME# supported from D0 D3hot D3cold
[    1.237581] pci 0000:72:00.4: [1022:15ba] type 00 class 0x0c0330 PCIe E=
ndpoint
[    1.237616] pci 0000:72:00.4: BAR 0 [mem 0xdd400000-0xdd4fffff 64bit]
[    1.237628] pci 0000:72:00.4: enabling Extended Tags
[    1.237681] pci 0000:72:00.4: PME# supported from D0 D3hot D3cold
[    1.237840] pci 0000:72:00.6: [1022:15e3] type 00 class 0x040300 PCIe E=
ndpoint
[    1.237873] pci 0000:72:00.6: BAR 0 [mem 0xdd780000-0xdd787fff]
[    1.237892] pci 0000:72:00.6: enabling Extended Tags
[    1.237934] pci 0000:72:00.6: PME# supported from D0 D3hot D3cold
[    1.238110] pci 0000:00:08.1: PCI bridge to [bus 72]
[    1.238181] pci 0000:73:00.0: [1022:14ec] type 00 class 0x130000 PCIe E=
ndpoint
[    1.238216] pci 0000:73:00.0: enabling Extended Tags
[    1.238270] pci 0000:73:00.0: PME# supported from D3hot D3cold
[    1.238399] pci 0000:73:00.1: [1022:1502] type 00 class 0x118000 PCIe E=
ndpoint
[    1.238434] pci 0000:73:00.1: BAR 0 [mem 0xdda00000-0xdda7ffff]
[    1.238438] pci 0000:73:00.1: BAR 1 [mem 0xddac0000-0xddac1fff]
[    1.238443] pci 0000:73:00.1: BAR 2 [mem 0xf810000000-0xf81003ffff 64bi=
t pref]
[    1.238447] pci 0000:73:00.1: BAR 4 [mem 0xdda80000-0xddabffff]
[    1.238456] pci 0000:73:00.1: enabling Extended Tags
[    1.238637] pci 0000:00:08.2: PCI bridge to [bus 73]
[    1.238743] pci 0000:74:00.0: [1022:14ec] type 00 class 0x130000 PCIe E=
ndpoint
[    1.238778] pci 0000:74:00.0: enabling Extended Tags
[    1.238935] pci 0000:74:00.3: [1022:15c0] type 00 class 0x0c0330 PCIe E=
ndpoint
[    1.238964] pci 0000:74:00.3: BAR 0 [mem 0xdd900000-0xdd9fffff 64bit]
[    1.238975] pci 0000:74:00.3: enabling Extended Tags
[    1.239020] pci 0000:74:00.3: PME# supported from D0 D3hot D3cold
[    1.239168] pci 0000:74:00.4: [1022:15c1] type 00 class 0x0c0330 PCIe E=
ndpoint
[    1.239197] pci 0000:74:00.4: BAR 0 [mem 0xdd800000-0xdd8fffff 64bit]
[    1.239208] pci 0000:74:00.4: enabling Extended Tags
[    1.239252] pci 0000:74:00.4: PME# supported from D0 D3hot D3cold
[    1.239413] pci 0000:00:08.3: PCI bridge to [bus 74]
[    1.239563] pci_bus 0000:00: on NUMA node 0
[    1.248889] pci 0000:03:00.0: [Firmware Bug]: ACPI status differs from =
reality
[    1.250830] pci 0000:03:04.0: [Firmware Bug]: ACPI status differs from =
reality
[    1.251350] pci 0000:03:05.0: [Firmware Bug]: ACPI status differs from =
reality
[    1.251922] pci 0000:03:06.0: [Firmware Bug]: ACPI status differs from =
reality
[    1.252493] pci 0000:03:07.0: [Firmware Bug]: ACPI status differs from =
reality
[    1.253064] pci 0000:03:08.0: [Firmware Bug]: ACPI status differs from =
reality
[    1.261302] ACPI: PCI: Interrupt link LNKA configured for IRQ 0
[    1.261393] ACPI: PCI: Interrupt link LNKB configured for IRQ 0
[    1.261475] ACPI: PCI: Interrupt link LNKC configured for IRQ 0
[    1.261571] ACPI: PCI: Interrupt link LNKD configured for IRQ 0
[    1.261660] ACPI: PCI: Interrupt link LNKE configured for IRQ 0
[    1.261736] ACPI: PCI: Interrupt link LNKF configured for IRQ 0
[    1.261812] ACPI: PCI: Interrupt link LNKG configured for IRQ 0
[    1.261894] ACPI: PCI: Interrupt link LNKH configured for IRQ 0
[    1.264239] iommu: Default domain type: Passthrough
[    1.264239] SCSI subsystem initialized
[    1.264239] libata version 3.00 loaded.
[    1.264239] ACPI: bus type USB registered
[    1.264239] usbcore: registered new interface driver usbfs
[    1.264239] usbcore: registered new interface driver hub
[    1.264239] usbcore: registered new device driver usb
[    1.309331] efivars: Registered efivars operations
[    1.309331] Advanced Linux Sound Architecture Driver Initialized.
[    1.309331] PCI: Using ACPI for IRQ routing
[    1.318834] PCI: pci_cache_line_size set to 64 bytes
[    1.318956] e820: register RAM buffer resource [mem 0x099ff000-0x0bffff=
ff]
[    1.318961] e820: register RAM buffer resource [mem 0x0a200000-0x0bffff=
ff]
[    1.318964] e820: register RAM buffer resource [mem 0x0b000000-0x0bffff=
ff]
[    1.318967] e820: register RAM buffer resource [mem 0x82861000-0x83ffff=
ff]
[    1.318971] e820: register RAM buffer resource [mem 0x85a03000-0x87ffff=
ff]
[    1.318974] e820: register RAM buffer resource [mem 0x87c2c000-0x87ffff=
ff]
[    1.318977] e820: register RAM buffer resource [mem 0x988ba000-0x9bffff=
ff]
[    1.318980] e820: register RAM buffer resource [mem 0x99e84000-0x9bffff=
ff]
[    1.318984] e820: register RAM buffer resource [mem 0x99ffa000-0x9bffff=
ff]
[    1.318987] e820: register RAM buffer resource [mem 0x9a000000-0x9bffff=
ff]
[    1.318990] e820: register RAM buffer resource [mem 0xfde300000-0xfdfff=
ffff]
[    1.319012] pci 0000:72:00.0: vgaarb: setting as boot VGA device
[    1.319012] pci 0000:72:00.0: vgaarb: bridge control possible
[    1.319012] pci 0000:72:00.0: vgaarb: VGA device added: decodes=3Dio+me=
m,owns=3Dnone,locks=3Dnone
[    1.319012] vgaarb: loaded
[    1.319012] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
[    1.319012] hpet0: 3 comparators, 32-bit 14.318180 MHz counter
[    1.319012] clocksource: Switched to clocksource tsc-early
[    1.319012] acpi PNP0C01:00: Reserved [mem 0xe0000000-0xefffffff]
[    1.319012] acpi PNP0C02:00: Could not reserve [mem 0xf7500000-0xf757ff=
ff]
[    1.319012] acpi PNP0C02:01: Reserved [mem 0xfe0000000-0x105fffffff]
[    1.319012] acpi PNP0C02:02: Reserved [io  0x0a00-0x0a2f]
[    1.319012] acpi PNP0C02:02: Reserved [io  0x0a30-0x0a3f]
[    1.319012] acpi PNP0C02:02: Reserved [io  0x0a40-0x0a4f]
[    1.319012] acpi PNP0C02:02: Reserved [mem 0xfe100000-0xfe11ffff]
[    1.319012] acpi PNP0C02:03: Skipped [io  0x0010-0x001f]
[    1.319012] acpi PNP0C02:03: Skipped [io  0x0022-0x003f]
[    1.319012] acpi PNP0C02:03: Skipped [io  0x0063]
[    1.319012] acpi PNP0C02:03: Skipped [io  0x0065]
[    1.319012] acpi PNP0C02:03: Skipped [io  0x0067-0x006f]
[    1.319012] acpi PNP0C02:03: Skipped [io  0x0072-0x007f]
[    1.319012] acpi PNP0C02:03: Skipped [io  0x0080]
[    1.319012] acpi PNP0C02:03: Skipped [io  0x0084-0x0086]
[    1.319012] acpi PNP0C02:03: Skipped [io  0x0088]
[    1.319012] acpi PNP0C02:03: Skipped [io  0x008c-0x008e]
[    1.319012] acpi PNP0C02:03: Skipped [io  0x0090-0x009f]
[    1.319012] acpi PNP0C02:03: Skipped [io  0x00a2-0x00bf]
[    1.319012] acpi PNP0C02:03: Skipped [io  0x00b1]
[    1.319012] acpi PNP0C02:03: Skipped [io  0x00e0-0x00ef]
[    1.319012] acpi PNP0C02:03: Reserved [io  0x04d0-0x04d1]
[    1.319012] acpi PNP0C02:03: Reserved [io  0x040b]
[    1.319012] acpi PNP0C02:03: Reserved [io  0x04d6]
[    1.319012] acpi PNP0C02:03: Reserved [io  0x0c00-0x0c01]
[    1.319012] acpi PNP0C02:03: Reserved [io  0x0c14]
[    1.319012] acpi PNP0C02:03: Reserved [io  0x0c50-0x0c51]
[    1.319012] acpi PNP0C02:03: Reserved [io  0x0c52]
[    1.319012] acpi PNP0C02:03: Reserved [io  0x0c6c]
[    1.319012] acpi PNP0C02:03: Reserved [io  0x0c6f]
[    1.319012] acpi PNP0C02:03: Reserved [io  0x0cd8-0x0cdf]
[    1.319012] acpi PNP0C02:03: Reserved [io  0x0800-0x089f]
[    1.319012] acpi PNP0C02:03: Reserved [io  0x0b00-0x0b0f]
[    1.319012] acpi PNP0C02:03: Reserved [io  0x0b20-0x0b3f]
[    1.319012] acpi PNP0C02:03: Reserved [io  0x0900-0x090f]
[    1.319012] acpi PNP0C02:03: Reserved [io  0x0910-0x091f]
[    1.319012] acpi PNP0C02:03: Reserved [mem 0xfedc0000-0xfedc0fff]
[    1.319012] acpi PNP0C02:03: Reserved [mem 0xfee00000-0xfee00fff]
[    1.319012] acpi PNP0C02:03: Reserved [mem 0xfec10000-0xfec10fff]
[    1.319012] acpi PNP0C02:03: Reserved [mem 0xfeb00000-0xfeb00fff]
[    1.319012] acpi PNP0C02:03: Reserved [mem 0xff000000-0xffffffff]
[    1.319012] pnp: PnP ACPI init
[    1.328228] pnp: PnP ACPI: found 0 devices
[    1.332903] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, =
max_idle_ns: 2085701024 ns
[    1.333009] NET: Registered PF_INET protocol family
[    1.333181] IP idents hash table entries: 262144 (order: 9, 2097152 byt=
es, linear)
[    1.335041] tcp_listen_portaddr_hash hash table entries: 32768 (order: =
7, 524288 bytes, linear)
[    1.335067] Table-perturb hash table entries: 65536 (order: 6, 262144 b=
ytes, linear)
[    1.335074] TCP established hash table entries: 524288 (order: 10, 4194=
304 bytes, linear)
[    1.335295] TCP bind hash table entries: 65536 (order: 9, 2097152 bytes=
, linear)
[    1.335368] TCP: Hash tables configured (established 524288 bind 65536)
[    1.335396] UDP hash table entries: 32768 (order: 9, 2097152 bytes, lin=
ear)
[    1.335515] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    1.335611] RPC: Registered named UNIX socket transport module.
[    1.335614] RPC: Registered udp transport module.
[    1.335616] RPC: Registered tcp transport module.
[    1.335619] RPC: Registered tcp-with-tls transport module.
[    1.335621] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    1.335873] pci 0000:11:01.0: bridge window [io  0x1000-0x0fff] to [bus=
 13] add_size 1000
[    1.335878] pci 0000:11:01.0: bridge window [mem 0x00100000-0x000fffff =
64bit pref] to [bus 13] add_size 200000 add_align 100000
[    1.335884] pci 0000:11:01.0: bridge window [mem 0x00100000-0x000fffff]=
 to [bus 13] add_size 200000 add_align 100000
[    1.335890] pci 0000:11:02.0: bridge window [io  0x1000-0x0fff] to [bus=
 14] add_size 1000
[    1.335894] pci 0000:11:02.0: bridge window [mem 0x00100000-0x000fffff =
64bit pref] to [bus 14] add_size 200000 add_align 100000
[    1.335899] pci 0000:11:02.0: bridge window [mem 0x00100000-0x000fffff]=
 to [bus 14] add_size 200000 add_align 100000
[    1.335904] pci 0000:11:03.0: bridge window [io  0x1000-0x0fff] to [bus=
 15] add_size 1000
[    1.335908] pci 0000:11:03.0: bridge window [mem 0x00100000-0x000fffff =
64bit pref] to [bus 15] add_size 200000 add_align 100000
[    1.335914] pci 0000:11:03.0: bridge window [mem 0x00100000-0x000fffff]=
 to [bus 15] add_size 200000 add_align 100000
[    1.335919] pci 0000:10:00.0: bridge window [io  0x1000-0x0fff] to [bus=
 11-16] add_size 3000
[    1.335926] pci 0000:10:00.0: bridge window [mem 0x00100000-0x000fffff =
64bit pref] to [bus 11-16] add_size 600000 add_align 100000
[    1.335934] pci 0000:10:00.0: bridge window [mem 0x00100000-0x000fffff]=
 to [bus 11-16] add_size 600000 add_align 100000
[    1.335946] pci 0000:00:01.2: PCI bridge to [bus 01]
[    1.335955] pci 0000:00:01.2:   bridge window [mem 0xddb00000-0xddbffff=
f]
[    1.335984] pci 0000:03:00.0: PCI bridge to [bus 04]
[    1.336000] pci 0000:03:02.0: PCI bridge to [bus 05]
[    1.336004] pci 0000:03:02.0:   bridge window [io  0xf000-0xffff]
[    1.336010] pci 0000:03:02.0:   bridge window [mem 0xdd000000-0xdd0ffff=
f]
[    1.336020] pci 0000:03:03.0: PCI bridge to [bus 06]
[    1.336025] pci 0000:03:03.0:   bridge window [mem 0xdca00000-0xdccffff=
f]
[    1.336035] pci 0000:03:04.0: PCI bridge to [bus 07]
[    1.336046] pci 0000:03:05.0: PCI bridge to [bus 08]
[    1.336057] pci 0000:03:06.0: PCI bridge to [bus 09]
[    1.336068] pci 0000:03:07.0: PCI bridge to [bus 0a]
[    1.336079] pci 0000:03:08.0: PCI bridge to [bus 0b]
[    1.336091] pci 0000:03:0c.0: PCI bridge to [bus 0c]
[    1.336096] pci 0000:03:0c.0:   bridge window [mem 0xdcf00000-0xdcfffff=
f]
[    1.336106] pci 0000:03:0d.0: PCI bridge to [bus 0d]
[    1.336111] pci 0000:03:0d.0:   bridge window [mem 0xdce00000-0xdceffff=
f]
[    1.336120] pci 0000:02:00.0: PCI bridge to [bus 03-0d]
[    1.336124] pci 0000:02:00.0:   bridge window [io  0xf000-0xffff]
[    1.336130] pci 0000:02:00.0:   bridge window [mem 0xdca00000-0xdd0ffff=
f]
[    1.336139] pci 0000:00:02.1: PCI bridge to [bus 02-0d]
[    1.336143] pci 0000:00:02.1:   bridge window [io  0xf000-0xffff]
[    1.336148] pci 0000:00:02.1:   bridge window [mem 0xdca00000-0xdd0ffff=
f]
[    1.336178] pci 0000:10:00.0: bridge window [mem 0xc4000000-0xc45fffff]=
: assigned
[    1.336182] pci 0000:10:00.0: bridge window [mem 0xd800000000-0xd8005ff=
fff 64bit pref]: assigned
[    1.336187] pci 0000:10:00.0: bridge window [io  0xb000-0xdfff]: assign=
ed
[    1.336195] pci 0000:11:01.0: bridge window [mem 0xc4000000-0xc41fffff]=
: assigned
[    1.336199] pci 0000:11:01.0: bridge window [mem 0xd800000000-0xd8001ff=
fff 64bit pref]: assigned
[    1.336203] pci 0000:11:02.0: bridge window [mem 0xc4200000-0xc43fffff]=
: assigned
[    1.336207] pci 0000:11:02.0: bridge window [mem 0xd800200000-0xd8003ff=
fff 64bit pref]: assigned
[    1.336212] pci 0000:11:03.0: bridge window [mem 0xc4400000-0xc45fffff]=
: assigned
[    1.336216] pci 0000:11:03.0: bridge window [mem 0xd800400000-0xd8005ff=
fff 64bit pref]: assigned
[    1.336220] pci 0000:11:01.0: bridge window [io  0xb000-0xbfff]: assign=
ed
[    1.336224] pci 0000:11:02.0: bridge window [io  0xc000-0xcfff]: assign=
ed
[    1.336227] pci 0000:11:03.0: bridge window [io  0xd000-0xdfff]: assign=
ed
[    1.336233] pci 0000:11:00.0: PCI bridge to [bus 12]
[    1.336264] pci 0000:11:01.0: PCI bridge to [bus 13]
[    1.336268] pci 0000:11:01.0:   bridge window [io  0xb000-0xbfff]
[    1.336278] pci 0000:11:01.0:   bridge window [mem 0xc4000000-0xc41ffff=
f]
[    1.336285] pci 0000:11:01.0:   bridge window [mem 0xd800000000-0xd8001=
fffff 64bit pref]
[    1.336297] pci 0000:11:02.0: PCI bridge to [bus 14]
[    1.336302] pci 0000:11:02.0:   bridge window [io  0xc000-0xcfff]
[    1.336311] pci 0000:11:02.0:   bridge window [mem 0xc4200000-0xc43ffff=
f]
[    1.336319] pci 0000:11:02.0:   bridge window [mem 0xd800200000-0xd8003=
fffff 64bit pref]
[    1.336331] pci 0000:11:03.0: PCI bridge to [bus 15]
[    1.336335] pci 0000:11:03.0:   bridge window [io  0xd000-0xdfff]
[    1.336345] pci 0000:11:03.0:   bridge window [mem 0xc4400000-0xc45ffff=
f]
[    1.336352] pci 0000:11:03.0:   bridge window [mem 0xd800400000-0xd8005=
fffff 64bit pref]
[    1.336364] pci 0000:11:04.0: PCI bridge to [bus 16]
[    1.336385] pci 0000:10:00.0: PCI bridge to [bus 11-16]
[    1.336390] pci 0000:10:00.0:   bridge window [io  0xb000-0xdfff]
[    1.336399] pci 0000:10:00.0:   bridge window [mem 0xc4000000-0xc45ffff=
f]
[    1.336406] pci 0000:10:00.0:   bridge window [mem 0xd800000000-0xd8005=
fffff 64bit pref]
[    1.336418] pci 0000:0f:00.0: PCI bridge to [bus 10-3f]
[    1.336422] pci 0000:0f:00.0:   bridge window [io  0xb000-0xdfff]
[    1.336428] pci 0000:0f:00.0:   bridge window [mem 0xc4000000-0xdbfffff=
f]
[    1.336433] pci 0000:0f:00.0:   bridge window [mem 0xd800000000-0xf7fff=
fffff 64bit pref]
[    1.336441] pci 0000:0f:01.0: PCI bridge to [bus 40-6f]
[    1.336445] pci 0000:0f:01.0:   bridge window [io  0x8000-0xafff]
[    1.336451] pci 0000:0f:01.0:   bridge window [mem 0xac000000-0xc3fffff=
f]
[    1.336456] pci 0000:0f:01.0:   bridge window [mem 0xb800000000-0xd7fff=
fffff 64bit pref]
[    1.336464] pci 0000:0f:02.0: PCI bridge to [bus 70]
[    1.336469] pci 0000:0f:02.0:   bridge window [mem 0xdc400000-0xdc7ffff=
f]
[    1.336479] pci 0000:0f:03.0: PCI bridge to [bus 71]
[    1.336484] pci 0000:0f:03.0:   bridge window [mem 0xdc000000-0xdc3ffff=
f]
[    1.336493] pci 0000:0e:00.0: PCI bridge to [bus 0f-71]
[    1.336497] pci 0000:0e:00.0:   bridge window [io  0x8000-0xdfff]
[    1.336503] pci 0000:0e:00.0:   bridge window [mem 0xac000000-0xdc7ffff=
f]
[    1.336508] pci 0000:0e:00.0:   bridge window [mem 0xb800000000-0xf7fff=
fffff 64bit pref]
[    1.336516] pci 0000:00:02.2: PCI bridge to [bus 0e-71]
[    1.336520] pci 0000:00:02.2:   bridge window [io  0x8000-0xdfff]
[    1.336525] pci 0000:00:02.2:   bridge window [mem 0xac000000-0xdc7ffff=
f]
[    1.336529] pci 0000:00:02.2:   bridge window [mem 0xb800000000-0xf7fff=
fffff 64bit pref]
[    1.336556] pci 0000:00:08.1: PCI bridge to [bus 72]
[    1.336560] pci 0000:00:08.1:   bridge window [io  0xe000-0xefff]
[    1.336565] pci 0000:00:08.1:   bridge window [mem 0xdd200000-0xdd7ffff=
f]
[    1.336569] pci 0000:00:08.1:   bridge window [mem 0xf800000000-0xf80ff=
fffff 64bit pref]
[    1.336576] pci 0000:00:08.2: PCI bridge to [bus 73]
[    1.336580] pci 0000:00:08.2:   bridge window [mem 0xdda00000-0xddaffff=
f]
[    1.336585] pci 0000:00:08.2:   bridge window [mem 0xf810000000-0xf8100=
fffff 64bit pref]
[    1.336592] pci 0000:00:08.3: PCI bridge to [bus 74]
[    1.336596] pci 0000:00:08.3:   bridge window [mem 0xdd800000-0xdd9ffff=
f]
[    1.336603] pci_bus 0000:00: resource 4 [io  0x0000-0x03af window]
[    1.336606] pci_bus 0000:00: resource 5 [io  0x03e0-0x0cf7 window]
[    1.336610] pci_bus 0000:00: resource 6 [io  0x03b0-0x03df window]
[    1.336613] pci_bus 0000:00: resource 7 [io  0x0d00-0xffff window]
[    1.336616] pci_bus 0000:00: resource 8 [mem 0x000a0000-0x000dffff wind=
ow]
[    1.336620] pci_bus 0000:00: resource 9 [mem 0xf2000000-0xf6ffffff wind=
ow]
[    1.336623] pci_bus 0000:00: resource 10 [mem 0xf0000000-0xf1ffffff win=
dow]
[    1.336627] pci_bus 0000:00: resource 11 [mem 0xa0000000-0xdfffffff win=
dow]
[    1.336630] pci_bus 0000:00: resource 12 [mem 0x1060000000-0xfcffffffff=
 window]
[    1.336634] pci_bus 0000:01: resource 1 [mem 0xddb00000-0xddbfffff]
[    1.336637] pci_bus 0000:02: resource 0 [io  0xf000-0xffff]
[    1.336640] pci_bus 0000:02: resource 1 [mem 0xdca00000-0xdd0fffff]
[    1.336644] pci_bus 0000:03: resource 0 [io  0xf000-0xffff]
[    1.336647] pci_bus 0000:03: resource 1 [mem 0xdca00000-0xdd0fffff]
[    1.336650] pci_bus 0000:05: resource 0 [io  0xf000-0xffff]
[    1.336653] pci_bus 0000:05: resource 1 [mem 0xdd000000-0xdd0fffff]
[    1.336656] pci_bus 0000:06: resource 1 [mem 0xdca00000-0xdccfffff]
[    1.336660] pci_bus 0000:0c: resource 1 [mem 0xdcf00000-0xdcffffff]
[    1.336663] pci_bus 0000:0d: resource 1 [mem 0xdce00000-0xdcefffff]
[    1.336666] pci_bus 0000:0e: resource 0 [io  0x8000-0xdfff]
[    1.336669] pci_bus 0000:0e: resource 1 [mem 0xac000000-0xdc7fffff]
[    1.336673] pci_bus 0000:0e: resource 2 [mem 0xb800000000-0xf7ffffffff =
64bit pref]
[    1.336676] pci_bus 0000:0f: resource 0 [io  0x8000-0xdfff]
[    1.336680] pci_bus 0000:0f: resource 1 [mem 0xac000000-0xdc7fffff]
[    1.336683] pci_bus 0000:0f: resource 2 [mem 0xb800000000-0xf7ffffffff =
64bit pref]
[    1.336686] pci_bus 0000:10: resource 0 [io  0xb000-0xdfff]
[    1.336689] pci_bus 0000:10: resource 1 [mem 0xc4000000-0xdbffffff]
[    1.336693] pci_bus 0000:10: resource 2 [mem 0xd800000000-0xf7ffffffff =
64bit pref]
[    1.336696] pci_bus 0000:11: resource 0 [io  0xb000-0xdfff]
[    1.336699] pci_bus 0000:11: resource 1 [mem 0xc4000000-0xc45fffff]
[    1.336703] pci_bus 0000:11: resource 2 [mem 0xd800000000-0xd8005fffff =
64bit pref]
[    1.336706] pci_bus 0000:13: resource 0 [io  0xb000-0xbfff]
[    1.336709] pci_bus 0000:13: resource 1 [mem 0xc4000000-0xc41fffff]
[    1.336713] pci_bus 0000:13: resource 2 [mem 0xd800000000-0xd8001fffff =
64bit pref]
[    1.336716] pci_bus 0000:14: resource 0 [io  0xc000-0xcfff]
[    1.336719] pci_bus 0000:14: resource 1 [mem 0xc4200000-0xc43fffff]
[    1.336723] pci_bus 0000:14: resource 2 [mem 0xd800200000-0xd8003fffff =
64bit pref]
[    1.336726] pci_bus 0000:15: resource 0 [io  0xd000-0xdfff]
[    1.336729] pci_bus 0000:15: resource 1 [mem 0xc4400000-0xc45fffff]
[    1.336733] pci_bus 0000:15: resource 2 [mem 0xd800400000-0xd8005fffff =
64bit pref]
[    1.336736] pci_bus 0000:40: resource 0 [io  0x8000-0xafff]
[    1.336739] pci_bus 0000:40: resource 1 [mem 0xac000000-0xc3ffffff]
[    1.336743] pci_bus 0000:40: resource 2 [mem 0xb800000000-0xd7ffffffff =
64bit pref]
[    1.336746] pci_bus 0000:70: resource 1 [mem 0xdc400000-0xdc7fffff]
[    1.336750] pci_bus 0000:71: resource 1 [mem 0xdc000000-0xdc3fffff]
[    1.336753] pci_bus 0000:72: resource 0 [io  0xe000-0xefff]
[    1.336756] pci_bus 0000:72: resource 1 [mem 0xdd200000-0xdd7fffff]
[    1.336759] pci_bus 0000:72: resource 2 [mem 0xf800000000-0xf80fffffff =
64bit pref]
[    1.336763] pci_bus 0000:73: resource 1 [mem 0xdda00000-0xddafffff]
[    1.336766] pci_bus 0000:73: resource 2 [mem 0xf810000000-0xf8100fffff =
64bit pref]
[    1.336770] pci_bus 0000:74: resource 1 [mem 0xdd800000-0xdd9fffff]
[    1.336964] pci 0000:00:00.0: enhanced atomics disabled
[    1.337379] pci 0000:72:00.1: D0 power state depends on 0000:72:00.0
[    1.337911] PCI: CLS 64 bytes, default 64
[    1.337941] NET: Registered PF_INET6 protocol family
[    1.338111] Segment Routing with IPv6
[    1.338120] In-situ OAM (IOAM) with IPv6
[    1.338182] pci 0000:00:00.2: AMD-Vi: IOMMU performance counters suppor=
ted
[    1.338282] pci 0000:00:01.0: Adding to iommu group 0
[    1.338314] pci 0000:00:01.2: Adding to iommu group 1
[    1.338394] pci 0000:00:02.0: Adding to iommu group 2
[    1.338426] pci 0000:00:02.1: Adding to iommu group 3
[    1.338453] pci 0000:00:02.2: Adding to iommu group 4
[    1.338493] pci 0000:00:03.0: Adding to iommu group 5
[    1.338532] pci 0000:00:04.0: Adding to iommu group 6
[    1.338621] pci 0000:00:08.0: Adding to iommu group 7
[    1.338653] pci 0000:00:08.1: Adding to iommu group 8
[    1.338681] pci 0000:00:08.2: Adding to iommu group 9
[    1.338709] pci 0000:00:08.3: Adding to iommu group 10
[    1.338763] pci 0000:00:14.0: Adding to iommu group 11
[    1.338789] pci 0000:00:14.3: Adding to iommu group 11
[    1.338930] pci 0000:00:18.0: Adding to iommu group 12
[    1.338957] pci 0000:00:18.1: Adding to iommu group 12
[    1.338983] pci 0000:00:18.2: Adding to iommu group 12
[    1.339009] pci 0000:00:18.3: Adding to iommu group 12
[    1.339035] pci 0000:00:18.4: Adding to iommu group 12
[    1.339063] pci 0000:00:18.5: Adding to iommu group 12
[    1.339090] pci 0000:00:18.6: Adding to iommu group 12
[    1.339116] pci 0000:00:18.7: Adding to iommu group 12
[    1.339149] pci 0000:01:00.0: Adding to iommu group 13
[    1.339182] pci 0000:02:00.0: Adding to iommu group 14
[    1.339216] pci 0000:03:00.0: Adding to iommu group 15
[    1.339251] pci 0000:03:02.0: Adding to iommu group 16
[    1.339286] pci 0000:03:03.0: Adding to iommu group 17
[    1.339320] pci 0000:03:04.0: Adding to iommu group 18
[    1.339355] pci 0000:03:05.0: Adding to iommu group 19
[    1.339391] pci 0000:03:06.0: Adding to iommu group 20
[    1.339424] pci 0000:03:07.0: Adding to iommu group 21
[    1.339459] pci 0000:03:08.0: Adding to iommu group 22
[    1.339493] pci 0000:03:0c.0: Adding to iommu group 23
[    1.339528] pci 0000:03:0d.0: Adding to iommu group 24
[    1.339537] pci 0000:05:00.0: Adding to iommu group 16
[    1.339545] pci 0000:06:00.0: Adding to iommu group 17
[    1.339553] pci 0000:0c:00.0: Adding to iommu group 23
[    1.339561] pci 0000:0d:00.0: Adding to iommu group 24
[    1.339591] pci 0000:0e:00.0: Adding to iommu group 25
[    1.339628] pci 0000:0f:00.0: Adding to iommu group 26
[    1.339661] pci 0000:0f:01.0: Adding to iommu group 27
[    1.339697] pci 0000:0f:02.0: Adding to iommu group 28
[    1.339729] pci 0000:0f:03.0: Adding to iommu group 29
[    1.339738] pci 0000:10:00.0: Adding to iommu group 26
[    1.339760] pci 0000:11:00.0: Adding to iommu group 26
[    1.339772] pci 0000:11:01.0: Adding to iommu group 26
[    1.339784] pci 0000:11:02.0: Adding to iommu group 26
[    1.339796] pci 0000:11:03.0: Adding to iommu group 26
[    1.339809] pci 0000:11:04.0: Adding to iommu group 26
[    1.339817] pci 0000:70:00.0: Adding to iommu group 28
[    1.339827] pci 0000:71:00.0: Adding to iommu group 29
[    1.339876] pci 0000:72:00.0: Adding to iommu group 30
[    1.339903] pci 0000:72:00.1: Adding to iommu group 31
[    1.339931] pci 0000:72:00.2: Adding to iommu group 32
[    1.339959] pci 0000:72:00.3: Adding to iommu group 33
[    1.339987] pci 0000:72:00.4: Adding to iommu group 34
[    1.340014] pci 0000:72:00.6: Adding to iommu group 35
[    1.340042] pci 0000:73:00.0: Adding to iommu group 36
[    1.340074] pci 0000:73:00.1: Adding to iommu group 37
[    1.340103] pci 0000:74:00.0: Adding to iommu group 38
[    1.340131] pci 0000:74:00.3: Adding to iommu group 39
[    1.340159] pci 0000:74:00.4: Adding to iommu group 40
[    1.342739] AMD-Vi: Extended features (0x246577efa2254afa, 0x0): PPR NX=
 GT [5] IA GA PC GA_vAPIC PerfOpt
[    1.342751] AMD-Vi: Interrupt remapping enabled
[    1.740744] AMD-Vi: Virtual APIC enabled
[    1.740782] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    1.740787] software IO TLB: mapped [mem 0x000000007dc3b000-0x000000008=
1c3b000] (64MB)
[    1.740839] ACPI: bus type thunderbolt registered
[    1.741050] thunderbolt 0000:71:00.0: enabling device (0000 -> 0002)
[    1.741129] thunderbolt 0000:71:00.0: IOMMU DMA protection is enabled
[    1.741135] thunderbolt 0000:71:00.0: total paths: 21
[    1.742174] thunderbolt 0000:71:00.0: allocating TX ring 0 of size 10
[    1.742255] thunderbolt 0000:71:00.0: allocating RX ring 0 of size 10
[    1.742330] thunderbolt 0000:71:00.0: control channel created
[    1.742333] thunderbolt 0000:71:00.0: using software connection manager
[    1.742465] thunderbolt 0000:71:00.0: created link from 0000:0f:00.0
[    1.742486] thunderbolt 0000:71:00.0: created link from 0000:0f:01.0
[    1.742556] thunderbolt 0000:71:00.0: NHI initialized, starting thunder=
bolt
[    1.742558] thunderbolt 0000:71:00.0: control channel starting...
[    1.742559] thunderbolt 0000:71:00.0: starting TX ring 0
[    1.742576] thunderbolt 0000:71:00.0: enabling interrupt at register 0x=
38200 bit 0 (0x0 -> 0x1)
[    1.742579] thunderbolt 0000:71:00.0: starting RX ring 0
[    1.742585] thunderbolt 0000:71:00.0: enabling interrupt at register 0x=
38200 bit 21 (0x1 -> 0x200001)
[    1.742592] thunderbolt 0000:71:00.0: security level set to user
[    1.742768] thunderbolt 0000:71:00.0: current switch config:
[    1.742769] thunderbolt 0000:71:00.0:  USB4 Switch: 174c:2428 (Revision=
: 0, TB Version: 32)
[    1.742771] thunderbolt 0000:71:00.0:   Max Port Number: 11
[    1.742773] thunderbolt 0000:71:00.0:   Config:
[    1.742774] thunderbolt 0000:71:00.0:    Upstream Port Number: 5 Depth:=
 0 Route String: 0x0 Enabled: 1, PlugEventsDelay: 255ms
[    1.742776] thunderbolt 0000:71:00.0:    unknown1: 0x0 unknown4: 0x0
[    1.744612] thunderbolt 0000:71:00.0: initializing Switch at 0x0 (depth=
: 0, up port: 5)
[    1.746941] thunderbolt 0000:71:00.0: 0: credit allocation parameters:
[    1.746944] thunderbolt 0000:71:00.0: 0:  USB3: 64
[    1.746947] thunderbolt 0000:71:00.0: 0:  DP AUX: 2
[    1.746949] thunderbolt 0000:71:00.0: 0:  DP main: 0
[    1.746952] thunderbolt 0000:71:00.0: 0:  PCIe: 64
[    1.746954] thunderbolt 0000:71:00.0: 0:  DMA: 32
[    1.749234] thunderbolt 0000:71:00.0: 0: DROM version: 1
[    1.749923] thunderbolt 0000:71:00.0: 0: uid: 0x5a447f00174c872d
[    1.750687] thunderbolt 0000:71:00.0:  Port 1: 0:0 (Revision: 0, TB Ver=
sion: 1, Type: Port (0x1))
[    1.750691] thunderbolt 0000:71:00.0:   Max hop id (in/out): 27/27
[    1.750694] thunderbolt 0000:71:00.0:   Max counters: 7
[    1.750696] thunderbolt 0000:71:00.0:   NFC Credits: 0x4ae00000
[    1.750699] thunderbolt 0000:71:00.0:   Credits (total/control): 174/2
[    1.751389] thunderbolt 0000:71:00.0:  Port 2: 0:0 (Revision: 0, TB Ver=
sion: 1, Type: Port (0x1))
[    1.751392] thunderbolt 0000:71:00.0:   Max hop id (in/out): 27/27
[    1.751395] thunderbolt 0000:71:00.0:   Max counters: 7
[    1.751397] thunderbolt 0000:71:00.0:   NFC Credits: 0x8ae00000
[    1.751400] thunderbolt 0000:71:00.0:   Credits (total/control): 174/2
[    1.752162] thunderbolt 0000:71:00.0:  Port 3: 0:0 (Revision: 0, TB Ver=
sion: 1, Type: Port (0x1))
[    1.752165] thunderbolt 0000:71:00.0:   Max hop id (in/out): 27/27
[    1.752168] thunderbolt 0000:71:00.0:   Max counters: 7
[    1.752170] thunderbolt 0000:71:00.0:   NFC Credits: 0xae00000
[    1.752172] thunderbolt 0000:71:00.0:   Credits (total/control): 174/2
[    1.752860] thunderbolt 0000:71:00.0:  Port 4: 0:0 (Revision: 0, TB Ver=
sion: 1, Type: Port (0x1))
[    1.752863] thunderbolt 0000:71:00.0:   Max hop id (in/out): 27/27
[    1.752866] thunderbolt 0000:71:00.0:   Max counters: 7
[    1.752868] thunderbolt 0000:71:00.0:   NFC Credits: 0xae00000
[    1.752870] thunderbolt 0000:71:00.0:   Credits (total/control): 174/2
[    1.753026] thunderbolt 0000:71:00.0:  Port 5: 0:0 (Revision: 0, TB Ver=
sion: 1, Type: NHI (0x2))
[    1.753029] thunderbolt 0000:71:00.0:   Max hop id (in/out): 20/27
[    1.753032] thunderbolt 0000:71:00.0:   Max counters: 0
[    1.753034] thunderbolt 0000:71:00.0:   NFC Credits: 0x0
[    1.753036] thunderbolt 0000:71:00.0:   Credits (total/control): 0/0
[    1.753192] thunderbolt 0000:71:00.0:  Port 6: 0:0 (Revision: 0, TB Ver=
sion: 1, Type: PCIe (0x100101))
[    1.753195] thunderbolt 0000:71:00.0:   Max hop id (in/out): 8/8
[    1.753198] thunderbolt 0000:71:00.0:   Max counters: 1
[    1.753200] thunderbolt 0000:71:00.0:   NFC Credits: 0x0
[    1.753202] thunderbolt 0000:71:00.0:   Credits (total/control): 0/0
[    1.753358] thunderbolt 0000:71:00.0:  Port 7: 0:0 (Revision: 0, TB Ver=
sion: 1, Type: PCIe (0x100101))
[    1.753362] thunderbolt 0000:71:00.0:   Max hop id (in/out): 8/8
[    1.753364] thunderbolt 0000:71:00.0:   Max counters: 1
[    1.753366] thunderbolt 0000:71:00.0:   NFC Credits: 0x0
[    1.753369] thunderbolt 0000:71:00.0:   Credits (total/control): 0/0
[    1.753524] thunderbolt 0000:71:00.0:  Port 8: 0:0 (Revision: 0, TB Ver=
sion: 1, Type: USB (0x200101))
[    1.753527] thunderbolt 0000:71:00.0:   Max hop id (in/out): 8/27
[    1.753530] thunderbolt 0000:71:00.0:   Max counters: 1
[    1.753532] thunderbolt 0000:71:00.0:   NFC Credits: 0x0
[    1.753535] thunderbolt 0000:71:00.0:   Credits (total/control): 0/0
[    1.753690] thunderbolt 0000:71:00.0:  Port 9: 0:0 (Revision: 0, TB Ver=
sion: 1, Type: USB (0x200101))
[    1.753693] thunderbolt 0000:71:00.0:   Max hop id (in/out): 8/27
[    1.753696] thunderbolt 0000:71:00.0:   Max counters: 1
[    1.753698] thunderbolt 0000:71:00.0:   NFC Credits: 0x0
[    1.753700] thunderbolt 0000:71:00.0:   Credits (total/control): 0/0
[    1.753855] thunderbolt 0000:71:00.0:  Port 10: 0:0 (Revision: 0, TB Ve=
rsion: 1, Type: DP/HDMI (0xe0101))
[    1.753859] thunderbolt 0000:71:00.0:   Max hop id (in/out): 9/27
[    1.753861] thunderbolt 0000:71:00.0:   Max counters: 0
[    1.753864] thunderbolt 0000:71:00.0:   NFC Credits: 0x0
[    1.753866] thunderbolt 0000:71:00.0:   Credits (total/control): 0/0
[    1.754021] thunderbolt 0000:71:00.0:  Port 11: 0:0 (Revision: 0, TB Ve=
rsion: 1, Type: DP/HDMI (0xe0101))
[    1.754025] thunderbolt 0000:71:00.0:   Max hop id (in/out): 9/27
[    1.754027] thunderbolt 0000:71:00.0:   Max counters: 0
[    1.754029] thunderbolt 0000:71:00.0:   NFC Credits: 0x0
[    1.754032] thunderbolt 0000:71:00.0:   Credits (total/control): 0/0
[    1.754034] thunderbolt 0000:71:00.0: 0: running quirk_stuck_pending
[    1.754042] thunderbolt 0000:71:00.0: 0:5: pending bit does not clear, =
reading it once
[    1.755950] thunderbolt 0000:71:00.0: 0: TMU: supports uni-directional =
mode
[    1.756028] thunderbolt 0000:71:00.0: 0: TMU: current mode: bi-directio=
nal, HiFi
[    1.757304] thunderbolt 0000:71:00.0: 0: NVM version 200011.240521
[    1.757443] thunderbolt 0000:71:00.0: 0: TMU: mode change bi-directiona=
l, HiFi -> uni-directional, LowRes requested
[    1.757778] thunderbolt 0000:71:00.0: 0: TMU: mode set to: uni-directio=
nal, LowRes
[    1.758018] thunderbolt 0000:71:00.0: 0: resetting
[    1.758978] thunderbolt 0000:71:00.0: acking hot unplug event on 0:1
[    1.790868] thunderbolt 0000:71:00.0: 0:10: DP IN resource available
[    1.791282] thunderbolt 0000:71:00.0: 0:11: DP IN resource available
[    1.791293] thunderbolt 0000:71:00.0: 0:1: got unplug event for disconn=
ected port, ignoring
[    1.791500] RAPL PMU: API unit is 2^-32 Joules, 2 fixed counters, 16384=
0 ms ovfl timer
[    1.791507] RAPL PMU: hw unit of domain package 2^-16 Joules
[    1.791512] RAPL PMU: hw unit of domain core 2^-16 Joules
[    1.791518] LVT offset 0 assigned for vector 0x400
[    1.791661] perf: AMD IBS detected (0x00000bff)
[    1.791777] amd_uncore: 4 amd_df counters detected
[    1.791793] amd_uncore: 6 amd_l3 counters detected
[    1.791804] amd_uncore: 4 amd_umc_0 counters detected
[    1.791815] amd_uncore: 4 amd_umc_1 counters detected
[    1.791826] amd_uncore: 4 amd_umc_2 counters detected
[    1.791835] amd_uncore: 4 amd_umc_3 counters detected
[    1.791945] perf/amd_iommu: Detected AMD IOMMU #0 (2 banks, 4 counters/=
bank).
[    1.791981] kvm_amd: TSC scaling supported
[    1.791985] kvm_amd: Nested Virtualization enabled
[    1.791990] kvm_amd: Nested Paging enabled
[    1.791994] kvm_amd: LBR virtualization supported
[    1.791999] kvm_amd: AVIC enabled
[    1.792003] kvm_amd: x2AVIC enabled (max 512 vCPUs)
[    1.792007] kvm_amd: Virtual GIF supported
[    1.792010] kvm_amd: Virtual NMI enabled
[    1.796345] mce: Machine check injector initialized
[    1.798036] Initialise system trusted keyrings
[    1.798075] workingset: timestamp_bits=3D46 (anon: 41) max_order=3D24 b=
ucket_order=3D0 (anon: 0)
[    1.798173] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    1.798209] Key type nfs_keyring registered
[    1.798275] NFS: Registering the id_resolver key type
[    1.798279] Key type id_resolver registered
[    1.798282] Key type id_legacy registered
[    1.798285] nfs4filelayout_init: NFSv4 File Layout Driver Registering..=
.
[    1.798289] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver Regis=
tering...
[    1.798328] fuse: init (API version 7.47)
[    1.798447] SGI XFS with security attributes, no debug enabled
[    1.798684] cryptd: max_cpu_qlen set to 1000
[    1.803306] NET: Registered PF_ALG protocol family
[    1.803315] Key type asymmetric registered
[    1.803317] Asymmetric key parser 'x509' registered
[    1.803328] Block layer SCSI generic (bsg) driver version 0.4 loaded (m=
ajor 249)
[    1.803332] io scheduler mq-deadline registered
[    1.803335] io scheduler kyber registered
[    1.803349] io scheduler bfq registered
[    1.804944] pcieport 0000:00:01.2: PME: Signaling with IRQ 49
[    1.805213] pcieport 0000:00:02.1: PME: Signaling with IRQ 50
[    1.805470] pcieport 0000:00:02.2: PME: Signaling with IRQ 51
[    1.805724] pcieport 0000:00:08.1: PME: Signaling with IRQ 52
[    1.806000] pcieport 0000:00:08.2: PME: Signaling with IRQ 53
[    1.806228] pcieport 0000:00:08.3: PME: Signaling with IRQ 54
[    1.808744] pcieport 0000:0f:00.0: pciehp: Slot #0 AttnBtn- PwrCtrl- MR=
L- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLAc=
tRep+
[    1.809236] pcieport 0000:0f:00.0: pciehp: Slot(0): Card not present
[    1.809248] pci_bus 0000:12: busn_res: [bus 12] is released
[    1.809550] pci_bus 0000:13: busn_res: [bus 13] is released
[    1.809630] pcieport 0000:0f:01.0: pciehp: Slot #0 AttnBtn- PwrCtrl- MR=
L- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLAc=
tRep+
[    1.809833] pci_bus 0000:14: busn_res: [bus 14] is released
[    1.810094] pci_bus 0000:15: busn_res: [bus 15] is released
[    1.810303] pci_bus 0000:16: busn_res: [bus 16] is released
[    1.810505] pci_bus 0000:11: busn_res: [bus 11-16] is released
[    1.814157] input: Power Button as /devices/platform/PNP0C0C:00/input/i=
nput0
[    1.814187] ACPI: button: Power Button [PWRB]
[    1.814232] input: Power Button as /devices/platform/LNXPWRBN:00/input/=
input1
[    1.814274] ACPI: button: Power Button [PWRF]
[    1.814399] ACPI: video: Video Device [VGA] (multi-head: yes  rom: no  =
post: no)
[    1.814700] input: Video Bus as /devices/pci0000:00/0000:00:08.1/acpi.v=
ideo_bus.0/input/input2
[    1.814750] Monitor-Mwait will be used to enter C-1 state
[    1.818221] Estimated ratio of average max frequency by base frequency =
(times 1024): 1143
[    1.818811] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    1.820090] Non-volatile memory driver v1.3
[    1.820523] ACPI: bus type drm_connector registered
[    1.834456] amdgpu: Virtual CRAT table created for CPU
[    1.834472] amdgpu: Topology: Add CPU node
[    1.834636] stackdepot: allocating hash table of 1048576 entries via kv=
calloc
[    1.835307] stackdepot: allocating space for 8192 stack pools via kvcal=
loc
[    1.835334] amdgpu 0000:72:00.0: enabling device (0006 -> 0007)
[    1.835395] amdgpu 0000:72:00.0: initializing kernel modesetting (IP DI=
SCOVERY 0x1002:0x15BF 0x1458:0xD000 0x06).
[    1.835433] amdgpu 0000:72:00.0: register mmio base: 0xDD700000
[    1.835436] amdgpu 0000:72:00.0: register mmio size: 524288
[    1.839109] amdgpu 0000:72:00.0: detected ip block number 0 <common_v1_=
0_0> (soc21_common)
[    1.839116] amdgpu 0000:72:00.0: detected ip block number 1 <gmc_v11_0_=
0> (gmc_v11_0)
[    1.839120] amdgpu 0000:72:00.0: detected ip block number 2 <ih_v6_0_0>=
 (ih_v6_0)
[    1.839124] amdgpu 0000:72:00.0: detected ip block number 3 <psp_v13_0_=
4> (psp)
[    1.839128] amdgpu 0000:72:00.0: detected ip block number 4 <smu_v13_0_=
0> (smu)
[    1.839132] amdgpu 0000:72:00.0: detected ip block number 5 <dce_v1_0_0=
> (dm)
[    1.839136] amdgpu 0000:72:00.0: detected ip block number 6 <gfx_v11_0_=
0> (gfx_v11_0)
[    1.839140] amdgpu 0000:72:00.0: detected ip block number 7 <sdma_v6_0_=
0> (sdma_v6_0)
[    1.839144] amdgpu 0000:72:00.0: detected ip block number 8 <vcn_v4_0_0=
> (vcn_v4_0)
[    1.839148] amdgpu 0000:72:00.0: detected ip block number 9 <jpeg_v4_0_=
0> (jpeg_v4_0)
[    1.839152] amdgpu 0000:72:00.0: detected ip block number 10 <mes_v11_0=
_0> (mes_v11_0)
[    1.839174] amdgpu 0000:72:00.0: Fetched VBIOS from VFCT
[    1.839179] amdgpu 0000:72:00.0: [drm] ATOM BIOS: 113-PHXGENERIC-001, b=
uild: 00132130, ver: 022.012.000.028.000001, 2024/12/10
[    1.840271] amdgpu 0000:72:00.0: vgaarb: deactivate vga console
[    1.840276] amdgpu 0000:72:00.0: Trusted Memory Zone (TMZ) feature enab=
led
[    1.840344] amdgpu 0000:72:00.0: vm size is 262144 GB, 4 levels, block =
size is 9-bit, fragment size is 9-bit
[    1.840371] amdgpu 0000:72:00.0: VRAM: 2048M 0x0000008000000000 - 0x000=
000807FFFFFFF (2048M used)
[    1.840375] amdgpu 0000:72:00.0: GART: 512M 0x00007FFF00000000 - 0x0000=
7FFF1FFFFFFF
[    1.840389] amdgpu 0000:72:00.0: [drm] Detected VRAM RAM=3D2048M, BAR=
=3D2048M
[    1.840392] amdgpu 0000:72:00.0: [drm] RAM width 64bits DDR5
[    1.840659] amdgpu 0000:72:00.0:  2048M of VRAM memory ready
[    1.840665] amdgpu 0000:72:00.0:  30931M of GTT memory ready.
[    1.840736] amdgpu 0000:72:00.0: [drm] GART: num cpu pages 131072, num =
gpu pages 131072
[    1.841254] amdgpu 0000:72:00.0: [drm] PCIE GART of 512M enabled (table=
 at 0x000000807FD00000).
[    1.841788] amdgpu 0000:72:00.0: [drm] Loading DMUB firmware via PSP: v=
ersion=3D0x08006500
[    1.842212] amdgpu 0000:72:00.0: [VCN instance 0] Found VCN firmware Ve=
rsion ENC: 1.24 DEC: 9 VEP: 0 Revision: 55
[    1.842353] amdgpu 0000:72:00.0: MES: vmid_uq_mask_mmhub 0x0000ff00, vm=
id_uq_mask_gfxhub 0x0000ff00
[    1.842357] amdgpu 0000:72:00.0: MES: gfx_hqd_mask 0x00000002, compute_=
hqd_mask 0x0000000c, sdma_hqd_mask 0x000000fc
[    1.867757] amdgpu 0000:72:00.0: reserve 0x4a00000 from 0x8070000000 fo=
r PSP TMR
[    2.250838] clocksource: Watchdog remote CPU 3 read timed out
[    2.549957] amdgpu 0000:72:00.0: RAS: optional ras ta ucode is not avai=
lable
[    2.558262] amdgpu 0000:72:00.0: RAP: optional rap ta ucode is not avai=
lable
[    2.558269] amdgpu 0000:72:00.0: SECUREDISPLAY: optional securedisplay =
ta ucode is not available
[    2.558335] amdgpu 0000:72:00.0: smu driver if version =3D 0x00000008, =
smu fw if version =3D 0x00000008, smu fw program =3D 0, smu fw version =3D=
 0x004c7500 (76.117.0)
[    2.584688] amdgpu 0000:72:00.0: SMU is initialized successfully!
[    2.585707] amdgpu 0000:72:00.0: [drm] Display Core v3.2.401 initialize=
d on DCN 3.1.4
[    2.585712] amdgpu 0000:72:00.0: [drm] DP-HDMI FRL PCON supported
[    2.588198] amdgpu 0000:72:00.0: [drm] DMUB hardware initialized: versi=
on=3D0x08006500
[    2.620490] amdgpu 0000:72:00.0: [drm] HDMI-A-1: PSR support 0, DC PSR =
ver -1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
[    2.620532] amdgpu 0000:72:00.0: [drm] HDMI-A-2: PSR support 0, DC PSR =
ver -1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
[    2.620607] amdgpu 0000:72:00.0: [drm] DP-1: PSR support 0, DC PSR ver =
-1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
[    2.620645] amdgpu 0000:72:00.0: [drm] DP-2: PSR support 0, DC PSR ver =
-1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
[    2.620717] amdgpu 0000:72:00.0: [drm] DP-3: PSR support 0, DC PSR ver =
-1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
[    2.620784] amdgpu 0000:72:00.0: [drm] DP-4: PSR support 0, DC PSR ver =
-1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
[    2.620858] amdgpu 0000:72:00.0: [drm] DP-5: PSR support 0, DC PSR ver =
-1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
[    2.620933] amdgpu 0000:72:00.0: [drm] DP-6: PSR support 0, DC PSR ver =
-1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
[    2.630137] kfd kfd: Allocated 3969056 bytes on gart
[    2.630157] kfd kfd: Total number of KFD nodes to be created: 1
[    2.630273] amdgpu: Virtual CRAT table created for GPU
[    2.630446] amdgpu: Topology: Add GPU node [0x1002:0x15bf]
[    2.630449] kfd kfd: added device 1002:15bf
[    2.630463] amdgpu 0000:72:00.0: SE 1, SH per SE 2, CU per SH 6, active=
_cu_number 12
[    2.630470] amdgpu 0000:72:00.0: ring gfx_0.0.0 uses VM inv eng 0 on hu=
b 0
[    2.630474] amdgpu 0000:72:00.0: ring gfx_0.1.0 uses VM inv eng 1 on hu=
b 0
[    2.630478] amdgpu 0000:72:00.0: ring comp_1.0.0 uses VM inv eng 4 on h=
ub 0
[    2.630481] amdgpu 0000:72:00.0: ring comp_1.1.0 uses VM inv eng 6 on h=
ub 0
[    2.630485] amdgpu 0000:72:00.0: ring comp_1.2.0 uses VM inv eng 7 on h=
ub 0
[    2.630488] amdgpu 0000:72:00.0: ring comp_1.3.0 uses VM inv eng 8 on h=
ub 0
[    2.630492] amdgpu 0000:72:00.0: ring comp_1.0.1 uses VM inv eng 9 on h=
ub 0
[    2.630495] amdgpu 0000:72:00.0: ring comp_1.1.1 uses VM inv eng 10 on =
hub 0
[    2.630499] amdgpu 0000:72:00.0: ring comp_1.2.1 uses VM inv eng 11 on =
hub 0
[    2.630502] amdgpu 0000:72:00.0: ring comp_1.3.1 uses VM inv eng 12 on =
hub 0
[    2.630506] amdgpu 0000:72:00.0: ring sdma0 uses VM inv eng 13 on hub 0
[    2.630509] amdgpu 0000:72:00.0: ring vcn_unified_0 uses VM inv eng 0 o=
n hub 8
[    2.630513] amdgpu 0000:72:00.0: ring jpeg_dec uses VM inv eng 1 on hub=
 8
[    2.630517] amdgpu 0000:72:00.0: ring mes_kiq_3.1.0 uses VM inv eng 14 =
on hub 0
[    2.631272] amdgpu 0000:72:00.0: Runtime PM not available
[    2.632145] amdgpu 0000:72:00.0: [drm] Registered 4 planes with drm pan=
ic
[    2.632162] [drm] Initialized amdgpu 3.65.0 for 0000:72:00.0 on minor 0
[    2.634110] amdgpu 0000:72:00.0: [drm] Cannot find any crtc or sizes
[    2.634129] [drm] pre_validate_dsc:1825 MST_DSC dsc precompute is not n=
eeded
[    2.637854] brd: module loaded
[    2.639499] loop: module loaded
[    2.639681] Loading iSCSI transport class v2.0-870.
[    2.639787] st: Version 20160209, fixed bufsize 32768, s/g segs 256
[    2.639815] SCSI Media Changer driver v0.25=20
[    2.639827] Key type psk registered
[    2.640157] nvme 0000:01:00.0: platform quirk: setting simple suspend
[    2.640262] nvme nvme0: pci function 0000:01:00.0
[    2.640468] ahci 0000:0d:00.0: SSS flag set, parallel bus scan disabled
[    2.640525] ahci 0000:0d:00.0: AHCI vers 0001.0301, 32 command slots, 6=
 Gbps, SATA mode
[    2.640530] ahci 0000:0d:00.0: 4/6 ports implemented (port mask 0xf)
[    2.640533] ahci 0000:0d:00.0: flags: 64bit ncq sntf stag pm led clo on=
ly pmp pio slum part sxs deso sadm sds apst=20
[    2.641219] scsi host0: ahci
[    2.641385] scsi host1: ahci
[    2.641541] scsi host2: ahci
[    2.641669] scsi host3: ahci
[    2.641793] scsi host4: ahci
[    2.641923] scsi host5: ahci
[    2.641981] ata1: SATA max UDMA/133 abar m1024@0xdce80000 port 0xdce801=
00 irq 68 lpm-pol 1 ext
[    2.641987] ata2: SATA max UDMA/133 abar m1024@0xdce80000 port 0xdce801=
80 irq 68 lpm-pol 1 ext
[    2.641992] ata3: SATA max UDMA/133 abar m1024@0xdce80000 port 0xdce802=
00 irq 68 lpm-pol 1 ext
[    2.641997] ata4: SATA max UDMA/133 abar m1024@0xdce80000 port 0xdce802=
80 irq 68 lpm-pol 1 ext
[    2.642001] ata5: DUMMY
[    2.642002] ata6: DUMMY
[    2.653929] nvme nvme0: D3 entry latency set to 10 seconds
[    2.654992] nvme nvme0: passthrough uses implicit buffer lengths
[    2.660175] nvme nvme0: 16/0/0 default/read/poll queues
[    2.663136] r8169 0000:05:00.0 eth0: RTL8125D, 10:ff:e0:67:3d:cd, XID 6=
88, IRQ 86 (1 total)
[    2.663144] r8169 0000:05:00.0 eth0: jumbo features [frames: 16362 byte=
s, tx checksumming: ko]
[    2.663279] xhci_hcd 0000:0c:00.0: xHCI Host Controller
[    2.663287] xhci_hcd 0000:0c:00.0: new USB bus registered, assigned bus=
 number 1
[    2.663520]  nvme0n1: p1 p2
[    2.719392] xhci_hcd 0000:0c:00.0: hcc params 0x0200ef81 hci version 0x=
110 quirks 0x0000000000000010
[    2.720113] xhci_hcd 0000:0c:00.0: xHCI Host Controller
[    2.720117] xhci_hcd 0000:0c:00.0: new USB bus registered, assigned bus=
 number 2
[    2.720123] xhci_hcd 0000:0c:00.0: Host supports USB 3.2 Enhanced Super=
Speed
[    2.720319] usb usb1: New USB device found: idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D7.04
[    2.720362] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Ser=
ialNumber=3D1
[    2.720365] usb usb1: Product: xHCI Host Controller
[    2.720369] usb usb1: Manufacturer: Linux 7.4.0-rc4-x86_64 xhci-hcd
[    2.720372] usb usb1: SerialNumber: 0000:0c:00.0
[    2.720560] hub 1-0:1.0: USB hub found
[    2.720588] hub 1-0:1.0: 12 ports detected
[    2.732716] usb usb2: We don't know the algorithms for LPM for this hos=
t, disabling LPM.
[    2.732721] usb usb2: New USB device found: idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D7.04
[    2.732751] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Ser=
ialNumber=3D1
[    2.732755] usb usb2: Product: xHCI Host Controller
[    2.732758] usb usb2: Manufacturer: Linux 7.4.0-rc4-x86_64 xhci-hcd
[    2.732761] usb usb2: SerialNumber: 0000:0c:00.0
[    2.732927] hub 2-0:1.0: USB hub found
[    2.732946] hub 2-0:1.0: 5 ports detected
[    2.738150] xhci_hcd 0000:70:00.0: xHCI Host Controller
[    2.738157] xhci_hcd 0000:70:00.0: new USB bus registered, assigned bus=
 number 3
[    2.740834] xhci_hcd 0000:70:00.0: hcc params 0x0200ef81 hci version 0x=
120 quirks 0x0000000200000010
[    2.741630] xhci_hcd 0000:70:00.0: xHCI Host Controller
[    2.741636] xhci_hcd 0000:70:00.0: new USB bus registered, assigned bus=
 number 4
[    2.741640] xhci_hcd 0000:70:00.0: Host supports USB 3.2 Enhanced Super=
Speed
[    2.741668] usb usb3: New USB device found: idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D7.04
[    2.741701] usb usb3: New USB device strings: Mfr=3D3, Product=3D2, Ser=
ialNumber=3D1
[    2.741705] usb usb3: Product: xHCI Host Controller
[    2.741708] usb usb3: Manufacturer: Linux 7.4.0-rc4-x86_64 xhci-hcd
[    2.741712] usb usb3: SerialNumber: 0000:70:00.0
[    2.741859] hub 3-0:1.0: USB hub found
[    2.741874] hub 3-0:1.0: 2 ports detected
[    2.744248] usb usb4: We don't know the algorithms for LPM for this hos=
t, disabling LPM.
[    2.744253] usb usb4: New USB device found: idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D7.04
[    2.744285] usb usb4: New USB device strings: Mfr=3D3, Product=3D2, Ser=
ialNumber=3D1
[    2.744290] usb usb4: Product: xHCI Host Controller
[    2.744293] usb usb4: Manufacturer: Linux 7.4.0-rc4-x86_64 xhci-hcd
[    2.744296] usb usb4: SerialNumber: 0000:70:00.0
[    2.744439] hub 4-0:1.0: USB hub found
[    2.744455] hub 4-0:1.0: 2 ports detected
[    2.747008] xhci_hcd 0000:72:00.3: xHCI Host Controller
[    2.747015] xhci_hcd 0000:72:00.3: new USB bus registered, assigned bus=
 number 5
[    2.747393] xhci_hcd 0000:72:00.3: hcc params 0x0128ffc5 hci version 0x=
120 quirks 0x0000000200000010
[    2.747908] xhci_hcd 0000:72:00.3: xHCI Host Controller
[    2.747913] xhci_hcd 0000:72:00.3: new USB bus registered, assigned bus=
 number 6
[    2.747917] xhci_hcd 0000:72:00.3: Host supports USB 3.1 Enhanced Super=
Speed
[    2.747934] usb usb5: New USB device found: idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D7.04
[    2.747965] usb usb5: New USB device strings: Mfr=3D3, Product=3D2, Ser=
ialNumber=3D1
[    2.747969] usb usb5: Product: xHCI Host Controller
[    2.747972] usb usb5: Manufacturer: Linux 7.4.0-rc4-x86_64 xhci-hcd
[    2.747975] usb usb5: SerialNumber: 0000:72:00.3
[    2.748121] hub 5-0:1.0: USB hub found
[    2.748139] hub 5-0:1.0: 2 ports detected
[    2.750345] usb usb6: We don't know the algorithms for LPM for this hos=
t, disabling LPM.
[    2.750349] usb usb6: New USB device found: idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D7.04
[    2.750379] usb usb6: New USB device strings: Mfr=3D3, Product=3D2, Ser=
ialNumber=3D1
[    2.750383] usb usb6: Product: xHCI Host Controller
[    2.750386] usb usb6: Manufacturer: Linux 7.4.0-rc4-x86_64 xhci-hcd
[    2.750389] usb usb6: SerialNumber: 0000:72:00.3
[    2.750544] hub 6-0:1.0: USB hub found
[    2.750567] hub 6-0:1.0: 2 ports detected
[    2.753064] xhci_hcd 0000:72:00.4: xHCI Host Controller
[    2.753070] xhci_hcd 0000:72:00.4: new USB bus registered, assigned bus=
 number 7
[    2.753418] xhci_hcd 0000:72:00.4: USB0 root hub has no ports
[    2.753430] xhci_hcd 0000:72:00.4: hcc params 0x0110ffc5 hci version 0x=
120 quirks 0x0000000200000010
[    2.753651] usb usb7: New USB device found: idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D7.04
[    2.753682] usb usb7: New USB device strings: Mfr=3D3, Product=3D2, Ser=
ialNumber=3D1
[    2.753686] usb usb7: Product: xHCI Host Controller
[    2.753689] usb usb7: Manufacturer: Linux 7.4.0-rc4-x86_64 xhci-hcd
[    2.753692] usb usb7: SerialNumber: 0000:72:00.4
[    2.753830] hub 7-0:1.0: USB hub found
[    2.753842] hub 7-0:1.0: 1 port detected
[    2.755595] xhci_hcd 0000:74:00.3: xHCI Host Controller
[    2.755601] xhci_hcd 0000:74:00.3: new USB bus registered, assigned bus=
 number 8
[    2.755957] xhci_hcd 0000:74:00.3: hcc params 0x0110ffc5 hci version 0x=
120 quirks 0x0000000200000010
[    2.756512] xhci_hcd 0000:74:00.3: xHCI Host Controller
[    2.756517] xhci_hcd 0000:74:00.3: new USB bus registered, assigned bus=
 number 9
[    2.756521] xhci_hcd 0000:74:00.3: Host supports USB 3.1 Enhanced Super=
Speed
[    2.756538] usb usb8: New USB device found: idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D7.04
[    2.756572] usb usb8: New USB device strings: Mfr=3D3, Product=3D2, Ser=
ialNumber=3D1
[    2.756576] usb usb8: Product: xHCI Host Controller
[    2.756578] usb usb8: Manufacturer: Linux 7.4.0-rc4-x86_64 xhci-hcd
[    2.756582] usb usb8: SerialNumber: 0000:74:00.3
[    2.756729] hub 8-0:1.0: USB hub found
[    2.756747] hub 8-0:1.0: 1 port detected
[    2.757877] usb usb9: We don't know the algorithms for LPM for this hos=
t, disabling LPM.
[    2.757881] usb usb9: New USB device found: idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D7.04
[    2.757911] usb usb9: New USB device strings: Mfr=3D3, Product=3D2, Ser=
ialNumber=3D1
[    2.757915] usb usb9: Product: xHCI Host Controller
[    2.757918] usb usb9: Manufacturer: Linux 7.4.0-rc4-x86_64 xhci-hcd
[    2.757921] usb usb9: SerialNumber: 0000:74:00.3
[    2.758057] hub 9-0:1.0: USB hub found
[    2.758076] hub 9-0:1.0: 1 port detected
[    2.759532] xhci_hcd 0000:74:00.4: xHCI Host Controller
[    2.759538] xhci_hcd 0000:74:00.4: new USB bus registered, assigned bus=
 number 10
[    2.759896] xhci_hcd 0000:74:00.4: hcc params 0x0110ffc5 hci version 0x=
120 quirks 0x0000000200000010
[    2.760444] xhci_hcd 0000:74:00.4: xHCI Host Controller
[    2.760449] xhci_hcd 0000:74:00.4: new USB bus registered, assigned bus=
 number 11
[    2.760453] xhci_hcd 0000:74:00.4: Host supports USB 3.1 Enhanced Super=
Speed
[    2.760469] usb usb10: New USB device found: idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D7.04
[    2.760500] usb usb10: New USB device strings: Mfr=3D3, Product=3D2, Se=
rialNumber=3D1
[    2.760504] usb usb10: Product: xHCI Host Controller
[    2.760507] usb usb10: Manufacturer: Linux 7.4.0-rc4-x86_64 xhci-hcd
[    2.760510] usb usb10: SerialNumber: 0000:74:00.4
[    2.760651] hub 10-0:1.0: USB hub found
[    2.760673] hub 10-0:1.0: 1 port detected
[    2.761848] usb usb11: We don't know the algorithms for LPM for this ho=
st, disabling LPM.
[    2.761852] usb usb11: New USB device found: idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D7.04
[    2.761882] usb usb11: New USB device strings: Mfr=3D3, Product=3D2, Se=
rialNumber=3D1
[    2.761886] usb usb11: Product: xHCI Host Controller
[    2.761889] usb usb11: Manufacturer: Linux 7.4.0-rc4-x86_64 xhci-hcd
[    2.761892] usb usb11: SerialNumber: 0000:74:00.4
[    2.762030] hub 11-0:1.0: USB hub found
[    2.762051] hub 11-0:1.0: 1 port detected
[    2.763556] usbcore: registered new interface driver usb-storage
[    2.763627] i8042: PNP: No PS/2 controller found.
[    2.763744] mousedev: PS/2 mouse device common for all mice
[    2.764077] rtc_cmos PNP0B00:00: RTC can wake from S4
[    2.764413] rtc_cmos PNP0B00:00: registered as rtc0
[    2.764451] rtc_cmos PNP0B00:00: setting system clock to 2026-11-26T17:=
40:01 UTC (1795714801)
[    2.764485] rtc_cmos PNP0B00:00: alarms up to one month, y3k, 114 bytes=
 nvram
[    2.764507] i2c_dev: i2c /dev entries driver
[    2.765064] ir_imon_decoder: IR iMON protocol handler initialized
[    2.765067] IR JVC protocol handler initialized
[    2.765069] IR MCE Keyboard/mouse protocol handler initialized
[    2.765072] IR NEC protocol handler initialized
[    2.765074] IR RC5(x/sz) protocol handler initialized
[    2.765077] IR RC6 protocol handler initialized
[    2.765079] IR RCMM protocol handler initialized
[    2.765081] IR SANYO protocol handler initialized
[    2.765084] IR Sharp protocol handler initialized
[    2.765086] IR Sony protocol handler initialized
[    2.765088] IR XMP protocol handler initialized
[    2.765099] device-mapper: uevent: version 1.0.3
[    2.765152] device-mapper: ioctl: 4.50.0-ioctl (2025-04-28) initialised=
: dm-devel@lists.linux.dev
[    2.767197] ccp 0000:72:00.2: enabling device (0000 -> 0002)
[    2.768636] ccp 0000:72:00.2: tee enabled
[    2.768997] ccp 0000:72:00.2: psp enabled
[    2.769043] ccp_crypto: Cannot load: there are no available CCPs
[    2.769062] hid: raw HID events driver (C) Jiri Kosina
[    2.769228] usbcore: registered new interface driver usbhid
[    2.769233] usbhid: USB HID core driver
[    2.769481] usbcore: registered new interface driver snd-usb-audio
[    2.770470] IPVS: Registered protocols ()
[    2.770478] IPVS: Connection hash table configured (size=3D4096, memory=
=3D32Kbytes)
[    2.770520] IPVS: ipvs loaded.
[    2.770646] NET: Registered PF_PACKET protocol family
[    2.770661] 8021q: 802.1Q VLAN Support v1.8
[    2.770673] Key type dns_resolver registered
[    2.773290] x86/amd: Previous system reset reason [0x00080800]: softwar=
e wrote 0x6 to reset control register 0xCF9
[    2.773305] AGESA: AGESA!V9 ComboAm5PI 1.3.0.1e
[    2.773320] microcode: Current revision: 0x0a70520a
[    2.773604] IPI shorthand broadcast: enabled
[    2.787094] sched_clock: Marking stable (2780001436, 710590)->(27988914=
41, -18179415)
[    2.787667] registered taskstats version 1
[    2.787768] Loading compiled-in X.509 certificates
[    2.791364] cfg80211: Loading compiled-in X.509 certificates for regula=
tory database
[    2.793240] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    2.793381] Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff06c7248db=
18c600'
[    2.801010] tsc: Refined TSC clocksource calibration: 4200.001 MHz
[    2.801034] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x3c=
8a6238495, max_idle_ns: 440795233402 ns
[    2.801162] clocksource: Switched to clocksource tsc
[    2.962653] ata1: SATA link down (SStatus 0 SControl 300)
[    3.011043] usb 5-2: new high-speed USB device number 2 using xhci_hcd
[    3.031023] usb 7-1: new high-speed USB device number 2 using xhci_hcd
[    3.081261] usb 1-6: new full-speed USB device number 2 using xhci_hcd
[    3.166538] usb 5-2: New USB device found: idVendor=3D0bda, idProduct=
=3D5411, bcdDevice=3D1.16
[    3.174273] usb 5-2: New USB device strings: Mfr=3D1, Product=3D2, Seri=
alNumber=3D0
[    3.174283] usb 5-2: Product: USB2.1 Hub
[    3.174287] usb 5-2: Manufacturer: Generic
[    3.181877] usb 7-1: New USB device found: idVendor=3D05e3, idProduct=
=3D0608, bcdDevice=3D60.70
[    3.185619] usb 7-1: New USB device strings: Mfr=3D0, Product=3D1, Seri=
alNumber=3D0
[    3.185636] usb 7-1: Product: USB2.0 Hub
[    3.229944] hub 5-2:1.0: USB hub found
[    3.231160] hub 5-2:1.0: 4 ports detected
[    3.235423] hub 7-1:1.0: USB hub found
[    3.236063] hub 7-1:1.0: 4 ports detected
[    3.292632] usb 6-2: new SuperSpeed USB device number 2 using xhci_hcd
[    3.318855] usb 6-2: New USB device found: idVendor=3D0bda, idProduct=
=3D0411, bcdDevice=3D1.16
[    3.326034] usb 6-2: New USB device strings: Mfr=3D1, Product=3D2, Seri=
alNumber=3D0
[    3.326047] usb 6-2: Product: USB3.2 Hub
[    3.326052] usb 6-2: Manufacturer: Generic
[    3.358195] hub 6-2:1.0: USB hub found
[    3.359813] hub 6-2:1.0: 4 ports detected
[    3.450834] ata2: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[    3.457331] ata2.00: ATA-8: ST2000LM003 HN-M201RAD, 2BC10001, max UDMA/=
133
[    3.457801] ata2.00: 3907029168 sectors, multi 16: LBA48 NCQ (depth 32)=
, AA
[    3.457812] ata2.00: Features: DIPM
[    3.464417] ata2.00: configured for UDMA/133
[    3.474727] scsi 1:0:0:0: Direct-Access     ATA      ST2000LM003 HN-M 0=
001 PQ: 0 ANSI: 5
[    3.475216] sd 1:0:0:0: [sda] 3907029168 512-byte logical blocks: (2.00=
 TB/1.82 TiB)
[    3.475226] sd 1:0:0:0: [sda] 4096-byte physical blocks
[    3.475242] sd 1:0:0:0: [sda] Write Protect is off
[    3.475248] sd 1:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    3.475275] sd 1:0:0:0: [sda] Write cache: enabled, read cache: enabled=
, doesn't support DPO or FUA
[    3.475318] sd 1:0:0:0: [sda] Preferred minimum I/O size 4096 bytes
[    3.499829] usb 1-6: New USB device found: idVendor=3D048d, idProduct=
=3D5711, bcdDevice=3D0.03
[    3.541036] usb 7-1.2: new low-speed USB device number 3 using xhci_hcd
[    3.560320] usb 1-6: New USB device strings: Mfr=3D1, Product=3D2, Seri=
alNumber=3D0
[    3.560333] usb 1-6: Product: GIGABYTE Device=20
[    3.560339] usb 1-6: Manufacturer: ITE Tech. Inc.
[    3.607270] hid-generic 0003:048D:5711.0001: hiddev96,hidraw0: USB HID =
v1.10 Device [ITE Tech. Inc. GIGABYTE Device ] on usb-0000:0c:00.0-6/input=
0
[    3.618957]  sda: sda2 sda4 sda6 sda8 sda10 sda16 sda17 sda18 sda19 sda=
20 sda21 sda22 sda23 sda24 sda25 sda26 sda27 sda28 sda29 sda30 sda31 sda32=
 sda33 sda34 sda35 sda36 sda37 sda38 sda39 sda40 sda41 sda42 sda43 sda44
[    3.621598] sd 1:0:0:0: [sda] Attached SCSI disk
[    3.642778] usb 7-1.2: New USB device found: idVendor=3D04b4, idProduct=
=3D0033, bcdDevice=3D1.00
[    3.642940] hid-generic 0003:048D:5711.0002: hiddev97,hidraw1: USB HID =
v1.10 Device [ITE Tech. Inc. GIGABYTE Device ] on usb-0000:0c:00.0-6/input=
1
[    3.650182] usb 7-1.2: New USB device strings: Mfr=3D0, Product=3D0, Se=
rialNumber=3D0
[    3.722876] input: HID 04b4:0033 as /devices/pci0000:00/0000:00:08.1/00=
00:72:00.4/usb7/7-1/7-1.2/7-1.2:1.0/0003:04B4:0033.0003/input/input3
[    3.723084] hid-generic 0003:04B4:0033.0003: input,hidraw2: USB HID v1.=
00 Mouse [HID 04b4:0033] on usb-0000:72:00.4-1.2/input0
[    3.793360] ata3: SATA link down (SStatus 0 SControl 300)
[    3.801034] usb 7-1.4: new low-speed USB device number 4 using xhci_hcd
[    3.841034] usb 1-9: new high-speed USB device number 3 using xhci_hcd
[    3.903057] usb 7-1.4: New USB device found: idVendor=3D046a, idProduct=
=3Dc098, bcdDevice=3D1.15
[    3.919471] usb 7-1.4: New USB device strings: Mfr=3D1, Product=3D2, Se=
rialNumber=3D0
[    3.919483] usb 7-1.4: Product: CHERRY Corded Device
[    3.919489] usb 7-1.4: Manufacturer: Cherry GmbH
[    4.009410] input: Cherry GmbH CHERRY Corded Device as /devices/pci0000=
:00/0000:00:08.1/0000:72:00.4/usb7/7-1/7-1.4/7-1.4:1.0/0003:046A:C098.0004=
/input/input4
[    4.061450] hid-generic 0003:046A:C098.0004: input,hidraw3: USB HID v1.=
11 Keyboard [Cherry GmbH CHERRY Corded Device] on usb-0000:72:00.4-1.4/inp=
ut0
[    4.069056] input: Cherry GmbH CHERRY Corded Device as /devices/pci0000=
:00/0000:00:08.1/0000:72:00.4/usb7/7-1/7-1.4/7-1.4:1.1/0003:046A:C098.0005=
/input/input5
[    4.069292] usb 1-9: New USB device found: idVendor=3D0489, idProduct=
=3De124, bcdDevice=3D1.00
[    4.090643] usb 1-9: New USB device strings: Mfr=3D5, Product=3D6, Seri=
alNumber=3D7
[    4.090655] usb 1-9: Product: Wireless_Device
[    4.090661] usb 1-9: Manufacturer: MediaTek Inc.
[    4.090666] usb 1-9: SerialNumber: 000000000
[    4.120913] hid-generic 0003:046A:C098.0005: input,hidraw4: USB HID v1.=
11 Device [Cherry GmbH CHERRY Corded Device] on usb-0000:72:00.4-1.4/input=
1
[    4.123555] ata4: SATA link down (SStatus 0 SControl 300)
[    4.134367] clk: Disabling unused clocks
[    4.134379] PM: genpd: Disabling unused power domains
[    4.134389] ALSA device list:
[    4.134393]   No soundcards found.
[    4.134410] Warning: unable to open an initial console.
[    4.135766] Freeing unused decrypted memory: 2036K
[    4.138548] Freeing unused kernel image (initmem) memory: 20948K
[    4.138566] Write protecting the kernel read-only data: 43008k
[    4.140516] Freeing unused kernel image (text/rodata gap) memory: 1248K
[    4.140704] Freeing unused kernel image (rodata/data gap) memory: 156K
[    4.183555] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    4.183564] Run /init as init process
[    4.183567]   with arguments:
[    4.183569]     /init
[    4.183570]     dolvm
[    4.183571]   with environment:
[    4.183572]     HOME=3D/
[    4.183574]     TERM=3Dlinux
[    4.183575]     crypt_root=3DLABEL=3Ddt8-luks
[    4.471135] udevd[975]: starting version 3.2.14
[    4.472339] udevd[976]: starting eudev-3.2.14
[    4.668878] thunderbolt 0000:71:00.0: acking hot plug event on 0:1
[    4.668940] thunderbolt 0000:71:00.0: 0:1: hotplug: scanning
[    4.669970] thunderbolt 0000:71:00.0: 0:1: is connected, link is up (st=
ate: 2)
[    4.670649] thunderbolt 0000:71:00.0: current switch config:
[    4.670657] thunderbolt 0000:71:00.0:  USB4 Switch: 8087:b26 (Revision:=
 3, TB Version: 32)
[    4.670663] thunderbolt 0000:71:00.0:   Max Port Number: 19
[    4.670665] thunderbolt 0000:71:00.0:   Config:
[    4.670668] thunderbolt 0000:71:00.0:    Upstream Port Number: 1 Depth:=
 0 Route String: 0x0 Enabled: 0, PlugEventsDelay: 10ms
[    4.670672] thunderbolt 0000:71:00.0:    unknown1: 0x0 unknown4: 0x0
[    4.673524] thunderbolt 0000:71:00.0: initializing Switch at 0x1 (depth=
: 1, up port: 1)
[    4.673741] thunderbolt 0000:71:00.0: 1: link: USB4
[    4.673745] thunderbolt 0000:71:00.0: 1: TBT3 support: yes, xHCI: no
[    4.674721] thunderbolt 0000:71:00.0: acking hot plug event on 0:2
[    4.676759] thunderbolt 0000:71:00.0: 1: credit allocation parameters:
[    4.676762] thunderbolt 0000:71:00.0: 1:  USB3: 14
[    4.676765] thunderbolt 0000:71:00.0: 1:  DP AUX: 1
[    4.676767] thunderbolt 0000:71:00.0: 1:  DP main: 18
[    4.676770] thunderbolt 0000:71:00.0: 1:  PCIe: 32
[    4.679136] thunderbolt 0000:71:00.0: acking hot plug event on 1:2
[    4.680732] thunderbolt 0000:71:00.0: 1: DROM version: 1
[    4.681158] thunderbolt 0000:71:00.0: 1: uid: 0x643a0900808732fc
[    4.681684] thunderbolt 0000:71:00.0:  Port 1: 8086:b26 (Revision: 3, T=
B Version: 1, Type: Port (0x1))
[    4.681688] thunderbolt 0000:71:00.0:   Max hop id (in/out): 19/19
[    4.681691] thunderbolt 0000:71:00.0:   Max counters: 16
[    4.681693] thunderbolt 0000:71:00.0:   NFC Credits: 0xc3c00000
[    4.681696] thunderbolt 0000:71:00.0:   Credits (total/control): 60/2
[    4.682291] thunderbolt 0000:71:00.0:  Port 2: 8086:b26 (Revision: 3, T=
B Version: 1, Type: Port (0x1))
[    4.682295] thunderbolt 0000:71:00.0:   Max hop id (in/out): 19/19
[    4.682297] thunderbolt 0000:71:00.0:   Max counters: 16
[    4.682300] thunderbolt 0000:71:00.0:   NFC Credits: 0xc3c00000
[    4.682302] thunderbolt 0000:71:00.0:   Credits (total/control): 60/2
[    4.682832] thunderbolt 0000:71:00.0:  Port 3: 8086:b26 (Revision: 3, T=
B Version: 1, Type: Port (0x1))
[    4.682835] thunderbolt 0000:71:00.0:   Max hop id (in/out): 19/19
[    4.682838] thunderbolt 0000:71:00.0:   Max counters: 16
[    4.682840] thunderbolt 0000:71:00.0:   NFC Credits: 0x83c00000
[    4.682842] thunderbolt 0000:71:00.0:   Credits (total/control): 60/2
[    4.683438] thunderbolt 0000:71:00.0:  Port 4: 8086:b26 (Revision: 3, T=
B Version: 1, Type: Port (0x1))
[    4.683441] thunderbolt 0000:71:00.0:   Max hop id (in/out): 19/19
[    4.683444] thunderbolt 0000:71:00.0:   Max counters: 16
[    4.683446] thunderbolt 0000:71:00.0:   NFC Credits: 0x83c00000
[    4.683448] thunderbolt 0000:71:00.0:   Credits (total/control): 60/2
[    4.683451] thunderbolt 0000:71:00.0: 1:5: disabled by eeprom
[    4.683453] thunderbolt 0000:71:00.0: 1:6: disabled by eeprom
[    4.683456] thunderbolt 0000:71:00.0: 1:7: disabled by eeprom
[    4.683458] thunderbolt 0000:71:00.0: 1:8: disabled by eeprom
[    4.683574] thunderbolt 0000:71:00.0:  Port 9: 8086:b26 (Revision: 3, T=
B Version: 1, Type: PCIe (0x100102))
[    4.683578] thunderbolt 0000:71:00.0:   Max hop id (in/out): 8/8
[    4.683580] thunderbolt 0000:71:00.0:   Max counters: 2
[    4.683583] thunderbolt 0000:71:00.0:   NFC Credits: 0x40800000
[    4.683585] thunderbolt 0000:71:00.0:   Credits (total/control): 8/0
[    4.683696] thunderbolt 0000:71:00.0:  Port 10: 8086:b26 (Revision: 3, =
TB Version: 1, Type: PCIe (0x100101))
[    4.683699] thunderbolt 0000:71:00.0:   Max hop id (in/out): 8/8
[    4.683701] thunderbolt 0000:71:00.0:   Max counters: 2
[    4.683704] thunderbolt 0000:71:00.0:   NFC Credits: 0x40800000
[    4.683706] thunderbolt 0000:71:00.0:   Credits (total/control): 8/0
[    4.683708] thunderbolt 0000:71:00.0: 1:11: disabled by eeprom
[    4.683711] thunderbolt 0000:71:00.0: 1:12: disabled by eeprom
[    4.683924] thunderbolt 0000:71:00.0:  Port 13: 8086:b26 (Revision: 1, =
TB Version: 1, Type: DP/HDMI (0xe0102))
[    4.683927] thunderbolt 0000:71:00.0:   Max hop id (in/out): 9/9
[    4.683930] thunderbolt 0000:71:00.0:   Max counters: 2
[    4.683932] thunderbolt 0000:71:00.0:   NFC Credits: 0x800000
[    4.683934] thunderbolt 0000:71:00.0:   Credits (total/control): 8/0
[    4.684149] thunderbolt 0000:71:00.0:  Port 14: 8086:b26 (Revision: 1, =
TB Version: 1, Type: DP/HDMI (0xe0102))
[    4.684152] thunderbolt 0000:71:00.0:   Max hop id (in/out): 9/9
[    4.684155] thunderbolt 0000:71:00.0:   Max counters: 2
[    4.684157] thunderbolt 0000:71:00.0:   NFC Credits: 0x800000
[    4.684159] thunderbolt 0000:71:00.0:   Credits (total/control): 8/0
[    4.684479] thunderbolt 0000:71:00.0:  Port 15: 8086:b26 (Revision: 1, =
TB Version: 1, Type: Inactive (0x0))
[    4.684481] thunderbolt 0000:71:00.0:   Max hop id (in/out): 0/0
[    4.684483] thunderbolt 0000:71:00.0:   Max counters: 0
[    4.684485] thunderbolt 0000:71:00.0:   NFC Credits: 0x0
[    4.684487] thunderbolt 0000:71:00.0:   Credits (total/control): 0/0
[    4.684596] thunderbolt 0000:71:00.0:  Port 16: 8086:b26 (Revision: 3, =
TB Version: 1, Type: USB (0x200102))
[    4.684599] thunderbolt 0000:71:00.0:   Max hop id (in/out): 8/8
[    4.684600] thunderbolt 0000:71:00.0:   Max counters: 2
[    4.684602] thunderbolt 0000:71:00.0:   NFC Credits: 0x800000
[    4.684604] thunderbolt 0000:71:00.0:   Credits (total/control): 8/0
[    4.684713] thunderbolt 0000:71:00.0:  Port 17: 8086:b26 (Revision: 3, =
TB Version: 1, Type: USB (0x200101))
[    4.684716] thunderbolt 0000:71:00.0:   Max hop id (in/out): 8/8
[    4.684718] thunderbolt 0000:71:00.0:   Max counters: 2
[    4.684719] thunderbolt 0000:71:00.0:   NFC Credits: 0x800000
[    4.684721] thunderbolt 0000:71:00.0:   Credits (total/control): 8/0
[    4.684830] thunderbolt 0000:71:00.0:  Port 18: 8086:b26 (Revision: 3, =
TB Version: 1, Type: USB (0x200101))
[    4.684832] thunderbolt 0000:71:00.0:   Max hop id (in/out): 8/8
[    4.684834] thunderbolt 0000:71:00.0:   Max counters: 2
[    4.684836] thunderbolt 0000:71:00.0:   NFC Credits: 0x800000
[    4.684837] thunderbolt 0000:71:00.0:   Credits (total/control): 8/0
[    4.684946] thunderbolt 0000:71:00.0:  Port 19: 8086:b26 (Revision: 3, =
TB Version: 1, Type: USB (0x200101))
[    4.684949] thunderbolt 0000:71:00.0:   Max hop id (in/out): 8/8
[    4.684950] thunderbolt 0000:71:00.0:   Max counters: 2
[    4.684952] thunderbolt 0000:71:00.0:   NFC Credits: 0x800000
[    4.684954] thunderbolt 0000:71:00.0:   Credits (total/control): 8/0
[    4.684956] thunderbolt 0000:71:00.0: 1: running quirk_dp_credit_alloca=
tion
[    4.685064] thunderbolt 0000:71:00.0: 1: current link speed 20.0 Gb/s
[    4.685066] thunderbolt 0000:71:00.0: 1: current link width symmetric, =
single lane
[    4.685347] thunderbolt 0000:71:00.0: 0:2: total credits changed 174 ->=
 174
[    4.685402] thunderbolt 0000:71:00.0: 1: CLx: current mode: disabled
[    4.687916] thunderbolt 0000:71:00.0: 1: TMU: supports uni-directional =
mode
[    4.688020] thunderbolt 0000:71:00.0: 1: TMU: current mode: off
[    4.689166] thunderbolt 0-1: new device found, vendor=3D0xd4 device=3D0=
xc052
[    4.689169] thunderbolt 0-1: DELL U3225QE
[    4.689290] thunderbolt 0000:71:00.0: 1: NVM version 44.83
[    4.689727] thunderbolt 0000:71:00.0: 0:2: is connected, link is up (st=
ate: 2)
[    4.690964] thunderbolt 0000:71:00.0: acking hot unplug event on 1:2
[    4.691493] thunderbolt 0000:71:00.0: acking hot unplug event on 0:2
[    4.692621] thunderbolt 0000:71:00.0: 0:2: total credits changed 174 ->=
 174
[    4.692676] thunderbolt 0000:71:00.0: 1:1: total credits changed 60 -> =
120
[    4.692731] thunderbolt 0000:71:00.0: 1:2: total credits changed 60 -> =
0
[    4.692844] thunderbolt 0000:71:00.0: 1: link width set to symmetric, d=
ual lanes
[    4.694782] thunderbolt 0000:71:00.0: 0:1: reading NVM authentication s=
tatus of retimers
[    4.899245] thunderbolt 0000:71:00.0: 0:1: disabling sideband transacti=
ons
[    5.002119] thunderbolt 0000:71:00.0: 1:1: CLx: CL0s/CL1 supported
[    5.002126] thunderbolt 0000:71:00.0: 0:1: CLx: CL0s/CL1 not supported
[    5.002129] thunderbolt 0000:71:00.0: 1: TMU: mode change off -> bi-dir=
ectional, HiFi requested
[    5.002212] thunderbolt 0000:71:00.0: 0: TMU: local_time[0]=3D0x2c7de00=
0
[    5.002215] thunderbolt 0000:71:00.0: 0: TMU: local_time[1]=3D0x00089b5=
e
[    5.002218] thunderbolt 0000:71:00.0: 0: TMU: local_time[2]=3D0x03e8000=
0
[    5.002573] thunderbolt 0000:71:00.0: 1: TMU: updated local time to 0x8=
9b5e2c7d
[    5.003456] thunderbolt 0000:71:00.0: 1: TMU: mode set to: bi-direction=
al, HiFi
[    5.005245] thunderbolt 0000:71:00.0: 1:1: reading NVM authentication s=
tatus of retimers
[    5.098861] thunderbolt 0000:71:00.0: acking hot plug event on 1:13
[    5.210401] thunderbolt 0000:71:00.0: 1:1: disabling sideband transacti=
ons
[    5.313572] thunderbolt 0000:71:00.0: 0:1: link maximum bandwidth 36000=
/36000 Mb/s
[    5.313753] thunderbolt 0000:71:00.0: 1:1: link maximum bandwidth 36000=
/36000 Mb/s
[    5.313833] thunderbolt 0000:71:00.0: 1:16: available bandwidth for new=
 USB3 tunnel 36000/36000 Mb/s
[    5.313992] thunderbolt 0000:71:00.0: 1:16: maximum required bandwidth =
for USB3 tunnel 9000 Mb/s
[    5.314000] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): activating
[    5.314003] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): allocating i=
nitial bandwidth 9000/9000 Mb/s
[    5.314526] thunderbolt 0000:71:00.0: 0:8: scaled bandwidth 2198/2198, =
scale 0
[    5.314941] thunderbolt 0000:71:00.0: activating USB3 Down path from 0:=
8 to 1:16
[    5.315096] thunderbolt 0000:71:00.0: 0:8: Writing hop 0
[    5.315099] thunderbolt 0000:71:00.0: 0:8:  In HopID: 8 =3D> Out port: =
1 Out HopID: 8
[    5.315103] thunderbolt 0000:71:00.0: 0:8:   Weight: 2 Priority: 3 Cred=
its: 0 Drop: 0 PM: 0
[    5.315106] thunderbolt 0000:71:00.0: 0:8:    Counter enabled: 0 Counte=
r index: 2047
[    5.315109] thunderbolt 0000:71:00.0: 0:8:   Flow Control (In/Eg): 1/1 =
Shared Buffer (In/Eg): 0/0
[    5.315113] thunderbolt 0000:71:00.0: 0:8:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[    5.315328] thunderbolt 0000:71:00.0: 1:1: Writing hop 1
[    5.315331] thunderbolt 0000:71:00.0: 1:1:  In HopID: 8 =3D> Out port: =
16 Out HopID: 8
[    5.315335] thunderbolt 0000:71:00.0: 1:1:   Weight: 2 Priority: 3 Cred=
its: 14 Drop: 0 PM: 0
[    5.315338] thunderbolt 0000:71:00.0: 1:1:    Counter enabled: 0 Counte=
r index: 2047
[    5.315341] thunderbolt 0000:71:00.0: 1:1:   Flow Control (In/Eg): 1/0 =
Shared Buffer (In/Eg): 0/0
[    5.315344] thunderbolt 0000:71:00.0: 1:1:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[    5.315413] thunderbolt 0000:71:00.0: USB3 Down path activation complet=
e
[    5.315416] thunderbolt 0000:71:00.0: activating USB3 Up path from 1:16=
 to 0:8
[    5.315536] thunderbolt 0000:71:00.0: 1:16: Writing hop 0
[    5.315539] thunderbolt 0000:71:00.0: 1:16:  In HopID: 8 =3D> Out port:=
 1 Out HopID: 8
[    5.315541] thunderbolt 0000:71:00.0: 1:16:   Weight: 2 Priority: 3 Cre=
dits: 2 Drop: 0 PM: 0
[    5.315545] thunderbolt 0000:71:00.0: 1:16:    Counter enabled: 0 Count=
er index: 2047
[    5.315547] thunderbolt 0000:71:00.0: 1:16:   Flow Control (In/Eg): 1/1=
 Shared Buffer (In/Eg): 0/0
[    5.315550] thunderbolt 0000:71:00.0: 1:16:   Unknown1: 0x0 Unknown2: 0=
x0 Unknown3: 0x0
[    5.315763] thunderbolt 0000:71:00.0: 0:1: Writing hop 1
[    5.315766] thunderbolt 0000:71:00.0: 0:1:  In HopID: 8 =3D> Out port: =
8 Out HopID: 8
[    5.315769] thunderbolt 0000:71:00.0: 0:1:   Weight: 2 Priority: 3 Cred=
its: 64 Drop: 0 PM: 0
[    5.315772] thunderbolt 0000:71:00.0: 0:1:    Counter enabled: 0 Counte=
r index: 2047
[    5.315775] thunderbolt 0000:71:00.0: 0:1:   Flow Control (In/Eg): 1/0 =
Shared Buffer (In/Eg): 0/0
[    5.315778] thunderbolt 0000:71:00.0: 0:1:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[    5.315878] thunderbolt 0000:71:00.0: USB3 Up path activation complete
[    5.316109] thunderbolt 0000:71:00.0: 1:3: is unplugged (state: 7)
[    5.316222] thunderbolt 0000:71:00.0: 1:13: DP adapter HPD set, queuing=
 hotplug
[    5.316280] thunderbolt 0000:71:00.0: 0:2: got plug event for connected=
 port, ignoring
[    5.316286] thunderbolt 0000:71:00.0: hotplug event for upstream port 1=
:2 (unplug: 0)
[    5.316292] thunderbolt 0000:71:00.0: hotplug event for upstream port 1=
:2 (unplug: 1)
[    5.316296] thunderbolt 0000:71:00.0: 0:2: got unplug event for disconn=
ected port, ignoring
[    5.316354] thunderbolt 0000:71:00.0: 1:13: DP OUT resource available a=
fter hotplug
[    5.316358] thunderbolt 0000:71:00.0: looking for DP IN <-> DP OUT pair=
s:
[    5.316436] thunderbolt 0000:71:00.0: 0:10: DP IN available
[    5.316511] thunderbolt 0000:71:00.0: 1:13: DP OUT available
[    5.316916] thunderbolt 0000:71:00.0: 0: allocated DP resource for port=
 10
[    5.316919] thunderbolt 0000:71:00.0: 0:10: attached to bandwidth group=
 1
[    5.317419] thunderbolt 0000:71:00.0: 0:8: scaled bandwidth 220/220, sc=
ale 0
[    5.317857] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): decreased ba=
ndwidth allocation to 900/900 Mb/s
[    5.318092] thunderbolt 0000:71:00.0: 0:1: link maximum bandwidth 36000=
/36000 Mb/s
[    5.318147] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): consumed ban=
dwidth 1350/1350 Mb/s
[    5.318279] thunderbolt 0000:71:00.0: 1:1: link maximum bandwidth 36000=
/36000 Mb/s
[    5.318334] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): consumed ban=
dwidth 1350/1350 Mb/s
[    5.318390] thunderbolt 0000:71:00.0: available bandwidth for new DP tu=
nnel 34650/34650 Mb/s
[    5.318397] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): activating
[    5.318758] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): DP IN maximum=
 supported bandwidth 8100 Mb/s x4 =3D 25920 Mb/s
[    5.318762] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): DP OUT maximu=
m supported bandwidth 8100 Mb/s x4 =3D 25920 Mb/s
[    5.318928] thunderbolt 0000:71:00.0: activating Video path from 0:10 t=
o 1:13
[    5.318932] thunderbolt 0000:71:00.0: 1:1: adding 18 NFC credits to 0
[    5.319145] thunderbolt 0000:71:00.0: 0:10: Writing hop 0
[    5.319148] thunderbolt 0000:71:00.0: 0:10:  In HopID: 9 =3D> Out port:=
 1 Out HopID: 9
[    5.319151] thunderbolt 0000:71:00.0: 0:10:   Weight: 1 Priority: 1 Cre=
dits: 0 Drop: 0 PM: 0
[    5.319154] thunderbolt 0000:71:00.0: 0:10:    Counter enabled: 0 Count=
er index: 2047
[    5.319157] thunderbolt 0000:71:00.0: 0:10:   Flow Control (In/Eg): 0/0=
 Shared Buffer (In/Eg): 0/0
[    5.319160] thunderbolt 0000:71:00.0: 0:10:   Unknown1: 0x0 Unknown2: 0=
x0 Unknown3: 0x0
[    5.319364] thunderbolt 0000:71:00.0: 1:1: Writing hop 1
[    5.319367] thunderbolt 0000:71:00.0: 1:1:  In HopID: 9 =3D> Out port: =
13 Out HopID: 9
[    5.319370] thunderbolt 0000:71:00.0: 1:1:   Weight: 1 Priority: 1 Cred=
its: 0 Drop: 0 PM: 0
[    5.319373] thunderbolt 0000:71:00.0: 1:1:    Counter enabled: 0 Counte=
r index: 2047
[    5.319376] thunderbolt 0000:71:00.0: 1:1:   Flow Control (In/Eg): 0/0 =
Shared Buffer (In/Eg): 0/0
[    5.319379] thunderbolt 0000:71:00.0: 1:1:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[    5.319440] thunderbolt 0000:71:00.0: Video path activation complete
[    5.319443] thunderbolt 0000:71:00.0: activating AUX TX path from 0:10 =
to 1:13
[    5.319599] thunderbolt 0000:71:00.0: 0:10: Writing hop 0
[    5.319602] thunderbolt 0000:71:00.0: 0:10:  In HopID: 8 =3D> Out port:=
 1 Out HopID: 10
[    5.319605] thunderbolt 0000:71:00.0: 0:10:   Weight: 1 Priority: 2 Cre=
dits: 0 Drop: 0 PM: 0
[    5.319608] thunderbolt 0000:71:00.0: 0:10:    Counter enabled: 0 Count=
er index: 2047
[    5.319611] thunderbolt 0000:71:00.0: 0:10:   Flow Control (In/Eg): 1/1=
 Shared Buffer (In/Eg): 0/0
[    5.319614] thunderbolt 0000:71:00.0: 0:10:   Unknown1: 0x0 Unknown2: 0=
x0 Unknown3: 0x0
[    5.319818] thunderbolt 0000:71:00.0: 1:1: Writing hop 1
[    5.319821] thunderbolt 0000:71:00.0: 1:1:  In HopID: 10 =3D> Out port:=
 13 Out HopID: 8
[    5.319824] thunderbolt 0000:71:00.0: 1:1:   Weight: 1 Priority: 2 Cred=
its: 1 Drop: 0 PM: 0
[    5.319827] thunderbolt 0000:71:00.0: 1:1:    Counter enabled: 0 Counte=
r index: 2047
[    5.319829] thunderbolt 0000:71:00.0: 1:1:   Flow Control (In/Eg): 1/0 =
Shared Buffer (In/Eg): 0/0
[    5.319832] thunderbolt 0000:71:00.0: 1:1:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[    5.319893] thunderbolt 0000:71:00.0: AUX TX path activation complete
[    5.319896] thunderbolt 0000:71:00.0: activating AUX RX path from 1:13 =
to 0:10
[    5.320009] thunderbolt 0000:71:00.0: 1:13: Writing hop 0
[    5.320012] thunderbolt 0000:71:00.0: 1:13:  In HopID: 8 =3D> Out port:=
 1 Out HopID: 9
[    5.320015] thunderbolt 0000:71:00.0: 1:13:   Weight: 1 Priority: 2 Cre=
dits: 8 Drop: 0 PM: 0
[    5.320018] thunderbolt 0000:71:00.0: 1:13:    Counter enabled: 0 Count=
er index: 2047
[    5.320020] thunderbolt 0000:71:00.0: 1:13:   Flow Control (In/Eg): 1/1=
 Shared Buffer (In/Eg): 0/0
[    5.320023] thunderbolt 0000:71:00.0: 1:13:   Unknown1: 0x0 Unknown2: 0=
x0 Unknown3: 0x0
[    5.320236] thunderbolt 0000:71:00.0: 0:1: Writing hop 1
[    5.320239] thunderbolt 0000:71:00.0: 0:1:  In HopID: 9 =3D> Out port: =
10 Out HopID: 8
[    5.320241] thunderbolt 0000:71:00.0: 0:1:   Weight: 1 Priority: 2 Cred=
its: 2 Drop: 0 PM: 0
[    5.320244] thunderbolt 0000:71:00.0: 0:1:    Counter enabled: 0 Counte=
r index: 2047
[    5.320247] thunderbolt 0000:71:00.0: 0:1:   Flow Control (In/Eg): 1/0 =
Shared Buffer (In/Eg): 0/0
[    5.320250] thunderbolt 0000:71:00.0: 0:1:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[    5.320349] thunderbolt 0000:71:00.0: AUX RX path activation complete
[    5.320733] thunderbolt 0000:71:00.0: 0:11: DP IN available
[    5.320787] thunderbolt 0000:71:00.0: 1:13: DP OUT in use
[    5.320789] thunderbolt 0000:71:00.0: 0:11: no suitable DP OUT adapter =
available, not tunneling
[    5.346020] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): DPRX read tim=
eout
[    5.426433] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): DPRX read tim=
eout
[    5.471223] usb 3-1: new high-speed USB device number 2 using xhci_hcd
[    5.491827] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): DPRX capabili=
ties read completed
[    5.492062] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): consumed band=
width 0/17280 Mb/s
[    5.492068] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): reclaiming u=
nused bandwidth
[    5.492301] thunderbolt 0000:71:00.0: 0:1: link maximum bandwidth 36000=
/36000 Mb/s
[    5.492611] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): consumed band=
width 0/25920 Mb/s
[    5.492679] thunderbolt 0000:71:00.0: 1:1: link maximum bandwidth 36000=
/36000 Mb/s
[    5.492961] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): consumed band=
width 0/25920 Mb/s
[    5.492965] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): available ba=
ndwidth 36000/10080 Mb/s
[    5.493588] thunderbolt 0000:71:00.0: 0:8: scaled bandwidth 2198/2198, =
scale 0
[    5.494021] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): increased ba=
ndwidth allocation to 9000/9000 Mb/s
[    5.494026] thunderbolt 0000:71:00.0: bandwidth consumption changed, re=
-calculating estimated bandwidth
[    5.494029] thunderbolt 0000:71:00.0: re-calculating bandwidth estimati=
on for group 1
[    5.494108] thunderbolt 0000:71:00.0: bandwidth estimation for group 1 =
done
[    5.494111] thunderbolt 0000:71:00.0: bandwidth re-calculation done
[    5.661731] fbcon: amdgpudrmfb (fb0) is primary device
[    5.691770] usb 3-1: New USB device found: idVendor=3D1d5c, idProduct=
=3D5801, bcdDevice=3D1.01
[    5.692292] usb 3-1: New USB device strings: Mfr=3D1, Product=3D2, Seri=
alNumber=3D0
[    5.692296] usb 3-1: Product: USB2.0 Hub
[    5.692298] usb 3-1: Manufacturer: Fresco Logic, Inc.
[    5.698901] hub 3-1:1.0: USB hub found
[    5.698980] hub 3-1:1.0: 6 ports detected
[    5.818993] Console: switching to colour frame buffer device 240x67
[    5.822622] usb 4-1: new SuperSpeed Plus Gen 2x1 USB device number 2 us=
ing xhci_hcd
[    5.842799] usb 4-1: New USB device found: idVendor=3D8087, idProduct=
=3D0b40, bcdDevice=3D12.34
[    5.844469] usb 4-1: New USB device strings: Mfr=3D1, Product=3D2, Seri=
alNumber=3D0
[    5.844472] usb 4-1: Product: USB3.0 Hub
[    5.844474] usb 4-1: Manufacturer: Intel Corporation.
[    5.851090] hub 4-1:1.0: USB hub found
[    5.851466] hub 4-1:1.0: 4 ports detected
[    5.875018] amdgpu 0000:72:00.0: [drm] fb0: amdgpudrmfb frame buffer de=
vice
[    6.250915] usb 3-1.4: new high-speed USB device number 3 using xhci_hc=
d
[    6.351414] usb 3-1.4: New USB device found: idVendor=3D0424, idProduct=
=3D4206, bcdDevice=3D6.25
[    6.351946] usb 3-1.4: New USB device strings: Mfr=3D1, Product=3D2, Se=
rialNumber=3D0
[    6.351950] usb 3-1.4: Product: USB4206 Smart Hub
[    6.351953] usb 3-1.4: Manufacturer: Microchip
[    6.358025] hub 3-1.4:1.0: USB hub found
[    6.358096] hub 3-1.4:1.0: 5 ports detected
[    6.432465] usb 4-1.4: new SuperSpeed Plus Gen 2x1 USB device number 3 =
using xhci_hcd
[    6.453287] usb 4-1.4: New USB device found: idVendor=3D0424, idProduct=
=3D7206, bcdDevice=3D6.25
[    6.455786] usb 4-1.4: New USB device strings: Mfr=3D1, Product=3D2, Se=
rialNumber=3D0
[    6.455794] usb 4-1.4: Product: USB7206 Smart Hub
[    6.455798] usb 4-1.4: Manufacturer: Microchip
[    6.462308] hub 4-1.4:1.0: USB hub found
[    6.462778] hub 4-1.4:1.0: 4 ports detected
[    6.671349] usb 3-1.4.1: new high-speed USB device number 4 using xhci_=
hcd
[    6.773980] usb 3-1.4.1: New USB device found: idVendor=3D0424, idProdu=
ct=3D4252, bcdDevice=3D2.33
[    6.777105] usb 3-1.4.1: New USB device strings: Mfr=3D1, Product=3D2, =
SerialNumber=3D0
[    6.777114] usb 3-1.4.1: Product: USB4206 Smart Hub
[    6.777117] usb 3-1.4.1: Manufacturer: Microchip
[    6.784785] hub 3-1.4.1:1.0: USB hub found
[    6.785043] hub 3-1.4.1:1.0: 5 ports detected
[    6.851973] usb 4-1.4.1: new SuperSpeed Plus Gen 2x1 USB device number =
4 using xhci_hcd
[    6.873898] usb 4-1.4.1: New USB device found: idVendor=3D0424, idProdu=
ct=3D7252, bcdDevice=3D2.33
[    6.876055] usb 4-1.4.1: New USB device strings: Mfr=3D1, Product=3D2, =
SerialNumber=3D0
[    6.876063] usb 4-1.4.1: Product: USB7206 Smart Hub
[    6.876066] usb 4-1.4.1: Manufacturer: Microchip
[    6.884996] hub 4-1.4.1:1.0: USB hub found
[    6.885469] hub 4-1.4.1:1.0: 4 ports detected
[    7.652231] usb 4-1.4.3: new SuperSpeed Plus Gen 2x1 USB device number =
5 using xhci_hcd
[    7.673598] usb 4-1.4.3: New USB device found: idVendor=3D0424, idProdu=
ct=3D7216, bcdDevice=3D2.43
[    7.675569] usb 4-1.4.3: New USB device strings: Mfr=3D1, Product=3D2, =
SerialNumber=3D0
[    7.675576] usb 4-1.4.3: Product: USB7216 Smart Hub
[    7.675580] usb 4-1.4.3: Manufacturer: Microchip
[    7.684357] hub 4-1.4.3:1.0: USB hub found
[    7.684929] hub 4-1.4.3:1.0: 3 ports detected
[    7.750946] usb 3-1.4.1.5: new high-speed USB device number 6 using xhc=
i_hcd
[    7.803140] xhci_hcd 0000:70:00.0: bad transfer trb length 4 in event t=
rb
[    7.855017] usb 3-1.4.1.5: New USB device found: idVendor=3D0424, idPro=
duct=3D7240, bcdDevice=3D2.09
[    7.861184] usb 3-1.4.1.5: New USB device strings: Mfr=3D1, Product=3D2=
, SerialNumber=3D0
[    7.861191] usb 3-1.4.1.5: Product: USB2 Controller Hub
[    7.861195] usb 3-1.4.1.5: Manufacturer: Microchip Tech
[    7.931023] usb 3-1.4.3: new high-speed USB device number 7 using xhci_=
hcd
[    8.034109] usb 3-1.4.3: New USB device found: idVendor=3D0424, idProdu=
ct=3D4216, bcdDevice=3D2.43
[    8.037440] usb 3-1.4.3: New USB device strings: Mfr=3D1, Product=3D2, =
SerialNumber=3D0
[    8.037448] usb 3-1.4.3: Product: USB4216 Smart Hub
[    8.037451] usb 3-1.4.3: Manufacturer: Microchip
[    8.047692] hub 3-1.4.3:1.0: USB hub found
[    8.047901] hub 3-1.4.3:1.0: 4 ports detected
[    8.132263] usb 4-1.4.2: new SuperSpeed USB device number 6 using xhci_=
hcd
[    8.152599] usb 4-1.4.2: New USB device found: idVendor=3D0bda, idProdu=
ct=3D8156, bcdDevice=3D31.10
[    8.154844] usb 4-1.4.2: Int endpoint with wBytesPerInterval of 8 in co=
nfig 2 interface 0 altsetting 0 ep 0x83: setting to 16
[    8.155836] usb 4-1.4.2: Int endpoint with wBytesPerInterval of 8 in co=
nfig 3 interface 0 altsetting 0 ep 0x83: setting to 16
[    8.157076] usb 4-1.4.2: New USB device strings: Mfr=3D1, Product=3D2, =
SerialNumber=3D6
[    8.157081] usb 4-1.4.2: Product: USB 10/100/1G/2.5G LAN
[    8.157085] usb 4-1.4.2: Manufacturer: Realtek
[    8.157087] usb 4-1.4.2: SerialNumber: 0113000001
[    8.241012] usb 3-1.4.5: new high-speed USB device number 8 using xhci_=
hcd
[    8.341793] usb 3-1.4.5: New USB device found: idVendor=3D0424, idProdu=
ct=3D7260, bcdDevice=3D6.25
[    8.342706] usb 3-1.4.5: New USB device strings: Mfr=3D1, Product=3D2, =
SerialNumber=3D0
[    8.342714] usb 3-1.4.5: Product: USB2 Controller Hub
[    8.342717] usb 3-1.4.5: Manufacturer: Microchip Tech
[    8.362065] hid-generic 0003:0424:7260.0006: hiddev98,hidraw5: USB HID =
v1.10 Device [Microchip Tech USB2 Controller Hub] on usb-0000:70:00.0-1.4.=
5/input1
[    8.781071] usb 3-1.4.3.4: new high-speed USB device number 9 using xhc=
i_hcd
[    8.885387] usb 3-1.4.3.4: New USB device found: idVendor=3D0424, idPro=
duct=3D7240, bcdDevice=3D2.09
[    8.894854] usb 3-1.4.3.4: New USB device strings: Mfr=3D1, Product=3D2=
, SerialNumber=3D0
[    8.894861] usb 3-1.4.3.4: Product: USB2 Controller Hub
[    8.894865] usb 3-1.4.3.4: Manufacturer: Microchip Tech
[   25.462330] PM: Image not found (code -22)
[   25.492893] XFS (dm-3): Mounting V5 Filesystem 2dde3c3b-d250-4709-a1fd-=
a1fc7da7be51
[   25.500370] XFS (dm-3): Ending clean mount
[   26.913529] ACPI Warning: SystemIO range 0x0000000000000B00-0x000000000=
0000B08 conflicts with OpRegion 0x0000000000000B00-0x0000000000000B0F (\GS=
A1.SMBI) (20260408/utaddress-204)
[   26.913539] ACPI: OSL: Resource conflict; ACPI support missing from dri=
ver?
[   26.927620] snd_hda_intel 0000:72:00.1: enabling device (0000 -> 0002)
[   26.927773] snd_hda_intel 0000:72:00.6: enabling device (0000 -> 0002)
[   26.929207] r8169 0000:05:00.0 enp5s0: renamed from eth0
[   26.952671] amdxdna 0000:73:00.1: [drm] Load firmware amdnpu/1502_00/np=
u_7.sbin
[   26.952683] amdxdna 0000:73:00.1: enabling device (0000 -> 0002)
[   26.954900] snd_hda_intel 0000:72:00.1: bound 0000:72:00.0 (ops 0xfffff=
fff82bd4700)
[   26.955217] mt7925e 0000:06:00.0: enabling device (0000 -> 0002)
[   26.956868] input: HD-Audio Generic HDMI/DP,pcm=3D3 as /devices/pci0000=
:00/0000:00:08.1/0000:72:00.1/sound/card0/input6
[   26.956953] input: HD-Audio Generic HDMI/DP,pcm=3D7 as /devices/pci0000=
:00/0000:00:08.1/0000:72:00.1/sound/card0/input7
[   26.957023] input: HD-Audio Generic HDMI/DP,pcm=3D8 as /devices/pci0000=
:00/0000:00:08.1/0000:72:00.1/sound/card0/input8
[   26.957096] input: HD-Audio Generic HDMI/DP,pcm=3D9 as /devices/pci0000=
:00/0000:00:08.1/0000:72:00.1/sound/card0/input9
[   26.959328] mt7925e 0000:06:00.0: ASIC revision: 79250000
[   26.960513] snd_hda_codec_alc882 hdaudioC1D0: autoconfig for ALC1220: l=
ine_outs=3D1 (0x14/0x0/0x0/0x0/0x0) type:line
[   26.960518] snd_hda_codec_alc882 hdaudioC1D0:    speaker_outs=3D0 (0x0/=
0x0/0x0/0x0/0x0)
[   26.960521] snd_hda_codec_alc882 hdaudioC1D0:    hp_outs=3D1 (0x1b/0x0/=
0x0/0x0/0x0)
[   26.960523] snd_hda_codec_alc882 hdaudioC1D0:    mono: mono_out=3D0x0
[   26.960525] snd_hda_codec_alc882 hdaudioC1D0:    dig-out=3D0x1e/0x0
[   26.960528] snd_hda_codec_alc882 hdaudioC1D0:    inputs:
[   26.960530] snd_hda_codec_alc882 hdaudioC1D0:      Rear Mic=3D0x18
[   26.960533] snd_hda_codec_alc882 hdaudioC1D0:      Front Mic=3D0x19
[   26.977162] usbcore: registered new device driver r8152-cfgselector
[   26.982330] input: HD-Audio Generic Rear Mic as /devices/pci0000:00/000=
0:00:08.1/0000:72:00.6/sound/card1/input10
[   26.983043] input: HD-Audio Generic Front Mic as /devices/pci0000:00/00=
00:00:08.1/0000:72:00.6/sound/card1/input11
[   26.983103] input: HD-Audio Generic Line Out as /devices/pci0000:00/000=
0:00:08.1/0000:72:00.6/sound/card1/input12
[   26.983170] input: HD-Audio Generic Front Headphone as /devices/pci0000=
:00/0000:00:08.1/0000:72:00.6/sound/card1/input13
[   26.995701] it87: it87 driver version <not provided>
[   26.995920] it87: Found IT8696E chip at 0xa40, revision 0
[   26.996020] it87: Beeping is supported
[   26.996073] ACPI Warning: SystemIO range 0x0000000000000A45-0x000000000=
0000A46 conflicts with OpRegion 0x0000000000000A45-0x0000000000000A46 (\GS=
A1.SIO1) (20260408/utaddress-204)
[   26.996080] ACPI: OSL: Resource conflict; ACPI support missing from dri=
ver?
[   27.010697] Bluetooth: Core ver 2.22
[   27.010720] NET: Registered PF_BLUETOOTH protocol family
[   27.010722] Bluetooth: HCI device and connection manager initialized
[   27.010726] Bluetooth: HCI socket layer initialized
[   27.010729] Bluetooth: L2CAP socket layer initialized
[   27.010733] Bluetooth: SCO socket layer initialized
[   27.016020] btusb 1-9:1.2: failed to enumerate endpoints
[   27.016058] usbcore: registered new interface driver btusb
[   27.027721] Bluetooth: hci0: Loading BT firmware: mediatek/mt7925/BT_RA=
M_CODE_MT7925_1_1_hdr.bin
[   27.027726] Bluetooth: hci0: BT HW ver: 0x7925, SW ver: 0x0000, Build T=
ime: 20261016233221
[   27.035621] mt7925e 0000:06:00.0: Loading firmware patch: mediatek/mt79=
25/WIFI_MT7925_PATCH_MCU_1_1_hdr.bin
[   27.036040] mt7925e 0000:06:00.0: HW/SW Version: 0x8a108a10, Build Time=
: 20261016232915a
[   27.071244] [drm] Initialized amdxdna_accel_driver 0.10.0 for 0000:73:0=
0.1 on minor 0
[   27.085699] r8152-cfgselector 4-1.4.2: reset SuperSpeed USB device numb=
er 6 using xhci_hcd
[   27.212836] usbcore: registered new interface driver r8152
[   27.272163] r8152 4-1.4.2:1.0 enp112s0u1u4u2: renamed from eth0
[   27.375714] mt7925e 0000:06:00.0: WM Firmware Version: ____000000, Buil=
d Time: 20261016233029
[   27.555364] Adding 67108860k swap on /dev/mapper/vg08-dt8--swap.  Prior=
ity:-1 extents:1 across:67108860k SS
[   27.595152] XFS (dm-4): Mounting V5 Filesystem 2b1e7db6-c6c2-470d-9b1a-=
54ead199e432
[   27.601701] XFS (dm-4): Ending clean mount
[   27.604629] XFS (dm-5): Mounting V5 Filesystem 9369d250-8672-4de2-8555-=
cfd26954c434
[   27.613052] XFS (dm-5): Ending clean mount
[   27.843961] elogind-daemon[2633]: New seat seat0.
[   27.847644] elogind-daemon[2633]: Watching system buttons on /dev/input=
/event4 (Cherry GmbH CHERRY Corded Device)
[   27.850915] elogind-daemon[2633]: Watching system buttons on /dev/input=
/event1 (Power Button)
[   27.850949] elogind-daemon[2633]: Watching system buttons on /dev/input=
/event0 (Power Button)
[   27.981078] mt7925e 0000:06:00.0 wlp6s0: renamed from wlan0
[   28.239314] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[   28.239317] Bluetooth: BNEP filters: protocol multicast
[   28.239320] Bluetooth: BNEP socket layer initialized
[   28.291257] thunderbolt 0000:71:00.0: 0:6 <-> 1:9 (PCI): activating
[   28.291378] thunderbolt 0000:71:00.0: activating PCIe Down path from 0:=
6 to 1:9
[   28.291515] thunderbolt 0000:71:00.0: 0:6: Writing hop 0
[   28.291518] thunderbolt 0000:71:00.0: 0:6:  In HopID: 8 =3D> Out port: =
1 Out HopID: 11
[   28.291521] thunderbolt 0000:71:00.0: 0:6:   Weight: 1 Priority: 3 Cred=
its: 0 Drop: 0 PM: 0
[   28.291525] thunderbolt 0000:71:00.0: 0:6:    Counter enabled: 0 Counte=
r index: 2047
[   28.291528] thunderbolt 0000:71:00.0: 0:6:   Flow Control (In/Eg): 1/1 =
Shared Buffer (In/Eg): 0/0
[   28.291531] thunderbolt 0000:71:00.0: 0:6:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[   28.291701] thunderbolt 0000:71:00.0: 1:1: Writing hop 1
[   28.291704] thunderbolt 0000:71:00.0: 1:1:  In HopID: 11 =3D> Out port:=
 9 Out HopID: 8
[   28.291707] thunderbolt 0000:71:00.0: 1:1:   Weight: 1 Priority: 3 Cred=
its: 32 Drop: 0 PM: 0
[   28.291711] thunderbolt 0000:71:00.0: 1:1:    Counter enabled: 0 Counte=
r index: 2047
[   28.291714] thunderbolt 0000:71:00.0: 1:1:   Flow Control (In/Eg): 1/0 =
Shared Buffer (In/Eg): 0/0
[   28.291717] thunderbolt 0000:71:00.0: 1:1:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[   28.291763] thunderbolt 0000:71:00.0: PCIe Down path activation complet=
e
[   28.291766] thunderbolt 0000:71:00.0: activating PCIe Up path from 1:9 =
to 0:6
[   28.291845] thunderbolt 0000:71:00.0: 1:9: Writing hop 0
[   28.291848] thunderbolt 0000:71:00.0: 1:9:  In HopID: 8 =3D> Out port: =
1 Out HopID: 10
[   28.291851] thunderbolt 0000:71:00.0: 1:9:   Weight: 1 Priority: 3 Cred=
its: 7 Drop: 0 PM: 0
[   28.291854] thunderbolt 0000:71:00.0: 1:9:    Counter enabled: 0 Counte=
r index: 2047
[   28.291857] thunderbolt 0000:71:00.0: 1:9:   Flow Control (In/Eg): 1/1 =
Shared Buffer (In/Eg): 0/0
[   28.291860] thunderbolt 0000:71:00.0: 1:9:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[   28.292042] thunderbolt 0000:71:00.0: 0:1: Writing hop 1
[   28.292045] thunderbolt 0000:71:00.0: 0:1:  In HopID: 10 =3D> Out port:=
 6 Out HopID: 8
[   28.292048] thunderbolt 0000:71:00.0: 0:1:   Weight: 1 Priority: 3 Cred=
its: 64 Drop: 0 PM: 0
[   28.292051] thunderbolt 0000:71:00.0: 0:1:    Counter enabled: 0 Counte=
r index: 2047
[   28.292054] thunderbolt 0000:71:00.0: 0:1:   Flow Control (In/Eg): 1/0 =
Shared Buffer (In/Eg): 0/0
[   28.292057] thunderbolt 0000:71:00.0: 0:1:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[   28.292143] thunderbolt 0000:71:00.0: PCIe Up path activation complete
[   28.810723] r8169 0000:05:00.0 enp5s0: PHY [r8169-0-500:00] driver [Rea=
ltek Internal NBASE-T PHY] (irq=3DMAC)
[   28.868347] Bluetooth: hci0: Device setup in 1808885 usecs
[   28.868354] Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection =
command is advertised, but not supported.
[   29.037526] Bluetooth: hci0: AOSP extensions version v1.00
[   29.037531] Bluetooth: hci0: AOSP quality report is supported
[   29.037740] Bluetooth: MGMT ver 1.23
[   29.356973] pcieport 0000:0f:00.0: pciehp: Slot(0): Card present
[   29.356980] pcieport 0000:0f:00.0: pciehp: Slot(0): Link Up
[   29.491083] pci 0000:10:00.0: [8086:0b26] type 01 class 0x060400 PCIe S=
witch Upstream Port
[   29.491132] pci 0000:10:00.0: PCI bridge to [bus 00]
[   29.491147] pci 0000:10:00.0:   bridge window [io  0x0000-0x0fff]
[   29.491154] pci 0000:10:00.0:   bridge window [mem 0x00000000-0x000ffff=
f]
[   29.491173] pci 0000:10:00.0:   bridge window [mem 0x00000000-0x000ffff=
f 64bit pref]
[   29.491196] pci 0000:10:00.0: enabling Extended Tags
[   29.491400] pci 0000:10:00.0: supports D1 D2
[   29.491403] pci 0000:10:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[   29.504176] pci 0000:10:00.0: 2.000 Gb/s available PCIe bandwidth, limi=
ted by 2.5 GT/s PCIe x1 link at 0000:0f:00.0 (capable of 8.000 Gb/s with 2=
.5 GT/s PCIe x4 link)
[   29.504347] pci 0000:10:00.0: Adding to iommu group 26
[   29.504396] pcieport 0000:0f:00.0: ASPM: current common clock configura=
tion is inconsistent, reconfiguring
[   29.520792] pci 0000:10:00.0: bridge configuration invalid ([bus 00-00]=
), reconfiguring
[   29.521039] pci 0000:11:00.0: [8086:0b26] type 01 class 0x060400 PCIe S=
witch Downstream Port
[   29.521086] pci 0000:11:00.0: PCI bridge to [bus 00]
[   29.521100] pci 0000:11:00.0:   bridge window [io  0x0000-0x0fff]
[   29.521107] pci 0000:11:00.0:   bridge window [mem 0x00000000-0x000ffff=
f]
[   29.521127] pci 0000:11:00.0:   bridge window [mem 0x00000000-0x000ffff=
f 64bit pref]
[   29.521152] pci 0000:11:00.0: enabling Extended Tags
[   29.521359] pci 0000:11:00.0: supports D1 D2
[   29.521362] pci 0000:11:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[   29.521711] pci 0000:11:00.0: Adding to iommu group 26
[   29.521849] pci 0000:11:01.0: [8086:0b26] type 01 class 0x060400 PCIe S=
witch Downstream Port
[   29.521893] pci 0000:11:01.0: PCI bridge to [bus 00]
[   29.521904] pci 0000:11:01.0:   bridge window [io  0x0000-0x0fff]
[   29.521910] pci 0000:11:01.0:   bridge window [mem 0x00000000-0x000ffff=
f]
[   29.521928] pci 0000:11:01.0:   bridge window [mem 0x00000000-0x000ffff=
f 64bit pref]
[   29.521951] pci 0000:11:01.0: enabling Extended Tags
[   29.522139] pci 0000:11:01.0: supports D1 D2
[   29.522141] pci 0000:11:01.0: PME# supported from D0 D1 D2 D3hot D3cold
[   29.522462] pci 0000:11:01.0: Adding to iommu group 26
[   29.522592] pci 0000:11:02.0: [8086:0b26] type 01 class 0x060400 PCIe S=
witch Downstream Port
[   29.522636] pci 0000:11:02.0: PCI bridge to [bus 00]
[   29.522647] pci 0000:11:02.0:   bridge window [io  0x0000-0x0fff]
[   29.522652] pci 0000:11:02.0:   bridge window [mem 0x00000000-0x000ffff=
f]
[   29.522670] pci 0000:11:02.0:   bridge window [mem 0x00000000-0x000ffff=
f 64bit pref]
[   29.522694] pci 0000:11:02.0: enabling Extended Tags
[   29.522881] pci 0000:11:02.0: supports D1 D2
[   29.522883] pci 0000:11:02.0: PME# supported from D0 D1 D2 D3hot D3cold
[   29.523201] pci 0000:11:02.0: Adding to iommu group 26
[   29.523332] pci 0000:11:03.0: [8086:0b26] type 01 class 0x060400 PCIe S=
witch Downstream Port
[   29.523376] pci 0000:11:03.0: PCI bridge to [bus 00]
[   29.523387] pci 0000:11:03.0:   bridge window [io  0x0000-0x0fff]
[   29.523392] pci 0000:11:03.0:   bridge window [mem 0x00000000-0x000ffff=
f]
[   29.523410] pci 0000:11:03.0:   bridge window [mem 0x00000000-0x000ffff=
f 64bit pref]
[   29.523433] pci 0000:11:03.0: enabling Extended Tags
[   29.523620] pci 0000:11:03.0: supports D1 D2
[   29.523622] pci 0000:11:03.0: PME# supported from D0 D1 D2 D3hot D3cold
[   29.523942] pci 0000:11:03.0: Adding to iommu group 26
[   29.524078] pci 0000:11:04.0: [8086:0b26] type 01 class 0x060400 PCIe S=
witch Downstream Port
[   29.524121] pci 0000:11:04.0: PCI bridge to [bus 00]
[   29.524132] pci 0000:11:04.0:   bridge window [io  0x0000-0x0fff]
[   29.524138] pci 0000:11:04.0:   bridge window [mem 0x00000000-0x000ffff=
f]
[   29.524155] pci 0000:11:04.0:   bridge window [mem 0x00000000-0x000ffff=
f 64bit pref]
[   29.524179] pci 0000:11:04.0: enabling Extended Tags
[   29.524372] pci 0000:11:04.0: supports D1 D2
[   29.524374] pci 0000:11:04.0: PME# supported from D0 D1 D2 D3hot D3cold
[   29.524710] pci 0000:11:04.0: Adding to iommu group 26
[   29.524804] pci 0000:10:00.0: PCI bridge to [bus 11-3f]
[   29.524827] pci 0000:11:00.0: bridge configuration invalid ([bus 00-00]=
), reconfiguring
[   29.524841] pci 0000:11:01.0: bridge configuration invalid ([bus 00-00]=
), reconfiguring
[   29.524855] pci 0000:11:02.0: bridge configuration invalid ([bus 00-00]=
), reconfiguring
[   29.524868] pci 0000:11:03.0: bridge configuration invalid ([bus 00-00]=
), reconfiguring
[   29.524881] pci 0000:11:04.0: bridge configuration invalid ([bus 00-00]=
), reconfiguring
[   29.524987] pci 0000:11:00.0: PCI bridge to [bus 12-3f]
[   29.525009] pci_bus 0000:12: busn_res: [bus 12-3f] end is updated to 12
[   29.525105] pci 0000:11:01.0: PCI bridge to [bus 13-3f]
[   29.525126] pci_bus 0000:13: busn_res: [bus 13-3f] end is updated to 21
[   29.525228] pci 0000:11:02.0: PCI bridge to [bus 22-3f]
[   29.525249] pci_bus 0000:22: busn_res: [bus 22-3f] end is updated to 30
[   29.525361] pci 0000:11:03.0: PCI bridge to [bus 31-3f]
[   29.525382] pci_bus 0000:31: busn_res: [bus 31-3f] end is updated to 3e
[   29.525484] pci 0000:11:04.0: PCI bridge to [bus 3f]
[   29.525505] pci_bus 0000:3f: busn_res: [bus 3f] end is updated to 3f
[   29.525514] pci_bus 0000:11: busn_res: [bus 11-3f] end is updated to 3f
[   29.525523] pci 0000:11:00.0: disabling bridge window [mem 0x00000000-0=
x000fffff 64bit pref] to [bus 12] (unused)
[   29.525527] pci 0000:11:00.0: disabling bridge window [mem 0x00000000-0=
x000fffff] to [bus 12] (unused)
[   29.525530] pci 0000:11:01.0: bridge window [mem 0x00100000-0x000fffff =
64bit pref] to [bus 13-21] add_size 200000 add_align 100000
[   29.525534] pci 0000:11:01.0: bridge window [mem 0x00100000-0x000fffff]=
 to [bus 13-21] add_size 200000 add_align 100000
[   29.525538] pci 0000:11:02.0: bridge window [mem 0x00100000-0x000fffff =
64bit pref] to [bus 22-30] add_size 200000 add_align 100000
[   29.525541] pci 0000:11:02.0: bridge window [mem 0x00100000-0x000fffff]=
 to [bus 22-30] add_size 200000 add_align 100000
[   29.525544] pci 0000:11:03.0: bridge window [mem 0x00100000-0x000fffff =
64bit pref] to [bus 31-3e] add_size 200000 add_align 100000
[   29.525548] pci 0000:11:03.0: bridge window [mem 0x00100000-0x000fffff]=
 to [bus 31-3e] add_size 200000 add_align 100000
[   29.525551] pci 0000:11:04.0: disabling bridge window [mem 0x00000000-0=
x000fffff 64bit pref] to [bus 3f] (unused)
[   29.525554] pci 0000:11:04.0: disabling bridge window [mem 0x00000000-0=
x000fffff] to [bus 3f] (unused)
[   29.525561] pci 0000:10:00.0: bridge window [mem 0x00100000-0x000fffff =
64bit pref] to [bus 11-3f] add_size 600000 add_align 100000
[   29.525568] pci 0000:10:00.0: bridge window [mem 0x00100000-0x000fffff]=
 to [bus 11-3f] add_size 600000 add_align 100000
[   29.525578] pci 0000:10:00.0: bridge window [mem 0xc4000000-0xdbffffff]=
: assigned
[   29.525582] pci 0000:10:00.0: bridge window [mem 0xd800000000-0xf7fffff=
fff 64bit pref]: assigned
[   29.525585] pci 0000:10:00.0: bridge window [io  size 0x5000]: can't as=
sign; no space
[   29.525588] pci 0000:10:00.0: bridge window [io  size 0x5000]: failed t=
o assign
[   29.525591] pci 0000:10:00.0: bridge window [io  size 0x5000]: can't as=
sign; no space
[   29.525594] pci 0000:10:00.0: bridge window [io  size 0x5000]: failed t=
o assign
[   29.525602] pci 0000:11:01.0: bridge window [mem 0xc4000000-0xcbefffff]=
: assigned
[   29.525605] pci 0000:11:01.0: bridge window [mem 0xd800000000-0xe2aa9ff=
fff 64bit pref]: assigned
[   29.525608] pci 0000:11:02.0: bridge window [mem 0xcbf00000-0xd3dfffff]=
: assigned
[   29.525611] pci 0000:11:02.0: bridge window [mem 0xe2aaa00000-0xed553ff=
fff 64bit pref]: assigned
[   29.525614] pci 0000:11:03.0: bridge window [mem 0xd3e00000-0xdbcfffff]=
: assigned
[   29.525617] pci 0000:11:03.0: bridge window [mem 0xed55400000-0xf7ffdff=
fff 64bit pref]: assigned
[   29.525620] pci 0000:11:00.0: bridge window [io  size 0x1000]: can't as=
sign; no space
[   29.525623] pci 0000:11:00.0: bridge window [io  size 0x1000]: failed t=
o assign
[   29.525625] pci 0000:11:01.0: bridge window [io  size 0x1000]: can't as=
sign; no space
[   29.525628] pci 0000:11:01.0: bridge window [io  size 0x1000]: failed t=
o assign
[   29.525630] pci 0000:11:02.0: bridge window [io  size 0x1000]: can't as=
sign; no space
[   29.525633] pci 0000:11:02.0: bridge window [io  size 0x1000]: failed t=
o assign
[   29.525636] pci 0000:11:03.0: bridge window [io  size 0x1000]: can't as=
sign; no space
[   29.525638] pci 0000:11:03.0: bridge window [io  size 0x1000]: failed t=
o assign
[   29.525641] pci 0000:11:04.0: bridge window [io  size 0x1000]: can't as=
sign; no space
[   29.525643] pci 0000:11:04.0: bridge window [io  size 0x1000]: failed t=
o assign
[   29.525648] pci 0000:11:00.0: bridge window [io  size 0x1000]: can't as=
sign; no space
[   29.525651] pci 0000:11:00.0: bridge window [io  size 0x1000]: failed t=
o assign
[   29.525653] pci 0000:11:01.0: bridge window [io  size 0x1000]: can't as=
sign; no space
[   29.525656] pci 0000:11:01.0: bridge window [io  size 0x1000]: failed t=
o assign
[   29.525658] pci 0000:11:02.0: bridge window [io  size 0x1000]: can't as=
sign; no space
[   29.525661] pci 0000:11:02.0: bridge window [io  size 0x1000]: failed t=
o assign
[   29.525663] pci 0000:11:03.0: bridge window [io  size 0x1000]: can't as=
sign; no space
[   29.525666] pci 0000:11:03.0: bridge window [io  size 0x1000]: failed t=
o assign
[   29.525669] pci 0000:11:04.0: bridge window [io  size 0x1000]: can't as=
sign; no space
[   29.525671] pci 0000:11:04.0: bridge window [io  size 0x1000]: failed t=
o assign
[   29.525675] pci 0000:11:00.0: PCI bridge to [bus 12]
[   29.525695] pci 0000:11:01.0: PCI bridge to [bus 13-21]
[   29.525703] pci 0000:11:01.0:   bridge window [mem 0xc4000000-0xcbeffff=
f]
[   29.525709] pci 0000:11:01.0:   bridge window [mem 0xd800000000-0xe2aa9=
fffff 64bit pref]
[   29.525719] pci 0000:11:02.0: PCI bridge to [bus 22-30]
[   29.525727] pci 0000:11:02.0:   bridge window [mem 0xcbf00000-0xd3dffff=
f]
[   29.525734] pci 0000:11:02.0:   bridge window [mem 0xe2aaa00000-0xed553=
fffff 64bit pref]
[   29.525744] pci 0000:11:03.0: PCI bridge to [bus 31-3e]
[   29.525752] pci 0000:11:03.0:   bridge window [mem 0xd3e00000-0xdbcffff=
f]
[   29.525758] pci 0000:11:03.0:   bridge window [mem 0xed55400000-0xf7ffd=
fffff 64bit pref]
[   29.525769] pci 0000:11:04.0: PCI bridge to [bus 3f]
[   29.525788] pci 0000:10:00.0: PCI bridge to [bus 11-3f]
[   29.525796] pci 0000:10:00.0:   bridge window [mem 0xc4000000-0xdbfffff=
f]
[   29.525802] pci 0000:10:00.0:   bridge window [mem 0xd800000000-0xf7fff=
fffff 64bit pref]
[   29.525812] pcieport 0000:0f:00.0: PCI bridge to [bus 10-3f]
[   29.525815] pcieport 0000:0f:00.0:   bridge window [io  0xb000-0xdfff]
[   29.525820] pcieport 0000:0f:00.0:   bridge window [mem 0xc4000000-0xdb=
ffffff]
[   29.525825] pcieport 0000:0f:00.0:   bridge window [mem 0xd800000000-0x=
f7ffffffff 64bit pref]
[   29.525830] PCI: No. 2 try to assign unassigned res
[   29.525834] pcieport 0000:0f:00.0: bridge window [io  0xb000-0xdfff]: r=
eleasing
[   29.525841] pci 0000:11:00.0: disabling bridge window [mem 0x00000000-0=
x000fffff 64bit pref disabled] to [bus 12] (unused)
[   29.525844] pci 0000:11:00.0: disabling bridge window [mem 0x00000000-0=
x000fffff disabled] to [bus 12] (unused)
[   29.525848] pci 0000:11:04.0: disabling bridge window [mem 0x00000000-0=
x000fffff 64bit pref disabled] to [bus 3f] (unused)
[   29.525851] pci 0000:11:04.0: disabling bridge window [mem 0x00000000-0=
x000fffff disabled] to [bus 3f] (unused)
[   29.525858] pcieport 0000:0f:00.0: bridge window [io  size 0x5000]: can=
't assign; no space
[   29.525861] pcieport 0000:0f:00.0: bridge window [io  size 0x5000]: fai=
led to assign
[   29.525864] pcieport 0000:0f:00.0: bridge window [io  size 0x5000]: can=
't assign; no space
[   29.525867] pcieport 0000:0f:00.0: bridge window [io  size 0x5000]: fai=
led to assign
[   29.525871] pci 0000:10:00.0: bridge window [io  size 0x5000]: can't as=
sign; no space
[   29.525873] pci 0000:10:00.0: bridge window [io  size 0x5000]: failed t=
o assign
[   29.525877] pci 0000:10:00.0: bridge window [io  size 0x5000]: can't as=
sign; no space
[   29.525879] pci 0000:10:00.0: bridge window [io  size 0x5000]: failed t=
o assign
[   29.525885] pci 0000:11:00.0: bridge window [io  size 0x1000]: can't as=
sign; no space
[   29.525887] pci 0000:11:00.0: bridge window [io  size 0x1000]: failed t=
o assign
[   29.525890] pci 0000:11:01.0: bridge window [io  size 0x1000]: can't as=
sign; no space
[   29.525892] pci 0000:11:01.0: bridge window [io  size 0x1000]: failed t=
o assign
[   29.525895] pci 0000:11:02.0: bridge window [io  size 0x1000]: can't as=
sign; no space
[   29.525897] pci 0000:11:02.0: bridge window [io  size 0x1000]: failed t=
o assign
[   29.525900] pci 0000:11:03.0: bridge window [io  size 0x1000]: can't as=
sign; no space
[   29.525902] pci 0000:11:03.0: bridge window [io  size 0x1000]: failed t=
o assign
[   29.525904] pci 0000:11:04.0: bridge window [io  size 0x1000]: can't as=
sign; no space
[   29.525906] pci 0000:11:04.0: bridge window [io  size 0x1000]: failed t=
o assign
[   29.525909] pci 0000:11:00.0: bridge window [io  size 0x1000]: can't as=
sign; no space
[   29.525912] pci 0000:11:00.0: bridge window [io  size 0x1000]: failed t=
o assign
[   29.525914] pci 0000:11:01.0: bridge window [io  size 0x1000]: can't as=
sign; no space
[   29.525916] pci 0000:11:01.0: bridge window [io  size 0x1000]: failed t=
o assign
[   29.525918] pci 0000:11:02.0: bridge window [io  size 0x1000]: can't as=
sign; no space
[   29.525920] pci 0000:11:02.0: bridge window [io  size 0x1000]: failed t=
o assign
[   29.525922] pci 0000:11:03.0: bridge window [io  size 0x1000]: can't as=
sign; no space
[   29.525924] pci 0000:11:03.0: bridge window [io  size 0x1000]: failed t=
o assign
[   29.525927] pci 0000:11:04.0: bridge window [io  size 0x1000]: can't as=
sign; no space
[   29.525929] pci 0000:11:04.0: bridge window [io  size 0x1000]: failed t=
o assign
[   29.525933] pci 0000:11:00.0: PCI bridge to [bus 12]
[   29.525952] pci 0000:11:01.0: PCI bridge to [bus 13-21]
[   29.525960] pci 0000:11:01.0:   bridge window [mem 0xc4000000-0xcbeffff=
f]
[   29.525966] pci 0000:11:01.0:   bridge window [mem 0xd800000000-0xe2aa9=
fffff 64bit pref]
[   29.525976] pci 0000:11:02.0: PCI bridge to [bus 22-30]
[   29.525984] pci 0000:11:02.0:   bridge window [mem 0xcbf00000-0xd3dffff=
f]
[   29.525990] pci 0000:11:02.0:   bridge window [mem 0xe2aaa00000-0xed553=
fffff 64bit pref]
[   29.526000] pci 0000:11:03.0: PCI bridge to [bus 31-3e]
[   29.526008] pci 0000:11:03.0:   bridge window [mem 0xd3e00000-0xdbcffff=
f]
[   29.526014] pci 0000:11:03.0:   bridge window [mem 0xed55400000-0xf7ffd=
fffff 64bit pref]
[   29.526024] pci 0000:11:04.0: PCI bridge to [bus 3f]
[   29.526043] pci 0000:10:00.0: PCI bridge to [bus 11-3f]
[   29.526051] pci 0000:10:00.0:   bridge window [mem 0xc4000000-0xdbfffff=
f]
[   29.526058] pci 0000:10:00.0:   bridge window [mem 0xd800000000-0xf7fff=
fffff 64bit pref]
[   29.526068] pcieport 0000:0f:00.0: PCI bridge to [bus 10-3f]
[   29.526073] pcieport 0000:0f:00.0:   bridge window [mem 0xc4000000-0xdb=
ffffff]
[   29.526077] pcieport 0000:0f:00.0:   bridge window [mem 0xd800000000-0x=
f7ffffffff 64bit pref]
[   29.526457] pcieport 0000:10:00.0: enabling device (0000 -> 0002)
[   29.527134] pcieport 0000:11:01.0: enabling device (0000 -> 0002)
[   29.527324] pcieport 0000:11:01.0: pciehp: Slot #1 AttnBtn- PwrCtrl- MR=
L- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLAc=
tRep+
[   29.527705] pcieport 0000:11:02.0: enabling device (0000 -> 0002)
[   29.527875] pcieport 0000:11:02.0: pciehp: Slot #2 AttnBtn- PwrCtrl- MR=
L- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLAc=
tRep+
[   29.528212] pcieport 0000:11:03.0: enabling device (0000 -> 0002)
[   29.528359] pcieport 0000:11:03.0: pciehp: Slot #3 AttnBtn- PwrCtrl- MR=
L- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLAc=
tRep+
[   35.128125] r8169 0000:05:00.0 enp5s0: configuring for phy/internal lin=
k mode
[   35.151319] bridge: filtering via arp/ip/ip6tables is no longer availab=
le by default. Update your scripts to load br_netfilter if you need this.
[   36.463430] elogind-daemon[2633]: New session c1 of user sddm.
[   38.152450] r8169 0000:05:00.0 enp5s0: Link is Up - 1Gbps/Full - flow c=
ontrol off
[   43.501108] elogind-daemon[2633]: New session 2 of user achim.
[   43.537842] elogind-daemon[2633]: PID 4066 for service 'openrc-user' ui=
d 1001 inherited audit session 2 from its parent, ignoring inherited audit=
 ID.
[   45.700394] warning: `kdeconnectd' uses wireless extensions which will =
stop working for Wi-Fi 7 hardware; use nl80211
[   46.138167] Bluetooth: RFCOMM TTY layer initialized
[   46.138175] Bluetooth: RFCOMM socket layer initialized
[   46.138182] Bluetooth: RFCOMM ver 1.11
[   48.992690] elogind-daemon[2633]: Session c1 logged out. Waiting for pr=
ocesses to exit.
[   48.992903] elogind-daemon[2633]: Removed session c1.
[   50.312936] input: M720 Triathlon Keyboard as /devices/virtual/misc/uhi=
d/0005:046D:B015.0007/input/input14
[   50.313090] input: M720 Triathlon Mouse as /devices/virtual/misc/uhid/0=
005:046D:B015.0007/input/input15
[   50.313240] hid-generic 0005:046D:B015.0007: input,hidraw6: BLUETOOTH H=
ID v0.13 Keyboard [M720 Triathlon] on 44:fa:66:66:18:84
[   50.443969] elogind-daemon[2633]: Watching system buttons on /dev/input=
/event14 (M720 Triathlon Keyboard)
[   78.129298] elogind-daemon[2633]: The system will suspend now!
[   78.348671] r8169 0000:05:00.0 enp5s0: Link is Down
[   78.410703] PM: suspend entry (deep)
[   78.434372] Filesystems sync: 0.023 seconds
[   78.446261] Freezing user space processes
[   78.499133] Freezing user space processes completed (elapsed 0.052 seco=
nds)
[   78.499145] OOM killer disabled.
[   78.499147] Freezing remaining freezable tasks
[   78.500363] Freezing remaining freezable tasks completed (elapsed 0.001=
 seconds)
[   78.500393] printk: Suspending console(s) (use no_console_suspend to de=
bug)
[   78.504923] xhci_hcd 0000:70:00.0: bad transfer trb length 4 in event t=
rb
[   78.513627] Bluetooth: hci0: ACL packet for unknown connection handle 5=
12
[   78.517471] queueing ieee80211 work while going to suspend
[   78.573961] sd 1:0:0:0: [sda] Synchronizing SCSI cache
[   78.574324] ata2.00: Entering standby power mode
[   78.615513] xhci_hcd 0000:70:00.0: bad transfer trb length 4 in event t=
rb
[   78.615944] xhci_hcd 0000:70:00.0: bad transfer trb length 4 in event t=
rb
[   78.634003] xhci_hcd 0000:70:00.0: bad transfer trb length 4 in event t=
rb
[   78.654050] xhci_hcd 0000:70:00.0: bad transfer trb length 4 in event t=
rb
[   79.914535] PM: suspend devices took 1.420 seconds
[   80.112118] thunderbolt 0000:71:00.0: suspending...
[   80.112123] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): deactivating
[   80.112705] thunderbolt 0000:71:00.0: deactivating Video path from 0:10=
 to 1:13
[   80.113197] thunderbolt 0000:71:00.0: 1:1: adding -18 NFC credits to 18
[   80.113255] thunderbolt 0000:71:00.0: deactivating AUX TX path from 0:1=
0 to 1:13
[   80.113663] thunderbolt 0000:71:00.0: deactivating AUX RX path from 1:1=
3 to 0:10
[   80.114149] thunderbolt 0000:71:00.0: 0:10: detached from bandwidth gro=
up 1
[   80.114546] thunderbolt 0000:71:00.0: 0: released DP resource for port =
10
[   80.114549] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): reclaiming u=
nused bandwidth
[   80.114771] thunderbolt 0000:71:00.0: 0:1: link maximum bandwidth 36000=
/36000 Mb/s
[   80.114894] thunderbolt 0000:71:00.0: 1:1: link maximum bandwidth 36000=
/36000 Mb/s
[   80.114944] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): available ba=
ndwidth 36000/36000 Mb/s
[   80.115075] thunderbolt 0000:71:00.0: 0: suspending switch
[   80.115077] thunderbolt 0000:71:00.0: 1: suspending switch
[   80.115079] thunderbolt 0000:71:00.0: 1: enabling wakeup: 0x1f
[   80.115720] thunderbolt 0000:71:00.0: 0: enabling wakeup: 0x1f
[   80.116777] thunderbolt 0000:71:00.0: suspend finished
[   80.116780] thunderbolt 0000:71:00.0: stopping RX ring 0
[   80.116784] thunderbolt 0000:71:00.0: disabling interrupt at register 0=
x38200 bit 21 (0x200001 -> 0x1)
[   80.116800] thunderbolt 0000:71:00.0: stopping TX ring 0
[   80.116804] thunderbolt 0000:71:00.0: disabling interrupt at register 0=
x38200 bit 0 (0x1 -> 0x0)
[   80.116815] thunderbolt 0000:71:00.0: control channel stopped
[   80.303336] ACPI: PM: Preparing to enter system sleep state S3
[   80.613988] ACPI: PM: Saving platform NVS memory
[   80.614172] Disabling non-boot CPUs ...
[   80.616281] smpboot: CPU 15 is now offline
[   80.618699] smpboot: CPU 14 is now offline
[   80.620746] smpboot: CPU 13 is now offline
[   80.622754] smpboot: CPU 12 is now offline
[   80.624817] smpboot: CPU 11 is now offline
[   80.626771] smpboot: CPU 10 is now offline
[   80.628716] smpboot: CPU 9 is now offline
[   80.630688] smpboot: CPU 8 is now offline
[   80.631072] Spectre V2 : Update user space SMT mitigation: STIBP off
[   80.632577] smpboot: CPU 7 is now offline
[   80.634487] smpboot: CPU 6 is now offline
[   80.636321] smpboot: CPU 5 is now offline
[   80.638225] smpboot: CPU 4 is now offline
[   80.640099] smpboot: CPU 3 is now offline
[   80.641989] smpboot: CPU 2 is now offline
[   80.643921] smpboot: CPU 1 is now offline
[   80.644844] ACPI: PM: Low-level resume complete
[   80.644872] ACPI: PM: Restoring platform NVS memory
[   80.651779] AMD-Vi: Virtual APIC enabled
[   80.725466] AMD-Vi: Virtual APIC enabled
[   80.725512] LVT offset 0 assigned for vector 0x400
[   80.726061] Enabling non-boot CPUs ...
[   80.726104] smpboot: Booting Node 0 Processor 1 APIC 0x2
[   80.728781] CPU1 is up
[   80.728798] smpboot: Booting Node 0 Processor 2 APIC 0x4
[   80.731419] CPU2 is up
[   80.731433] smpboot: Booting Node 0 Processor 3 APIC 0x6
[   80.734172] CPU3 is up
[   80.734188] smpboot: Booting Node 0 Processor 4 APIC 0x8
[   80.736864] CPU4 is up
[   80.736893] smpboot: Booting Node 0 Processor 5 APIC 0xa
[   80.739533] CPU5 is up
[   80.739558] smpboot: Booting Node 0 Processor 6 APIC 0xc
[   80.742202] CPU6 is up
[   80.742226] smpboot: Booting Node 0 Processor 7 APIC 0xe
[   80.745004] CPU7 is up
[   80.745030] smpboot: Booting Node 0 Processor 8 APIC 0x1
[   80.747831] Spectre V2 : Update user space SMT mitigation: STIBP always=
-on
[   80.747870] CPU8 is up
[   80.747895] smpboot: Booting Node 0 Processor 9 APIC 0x3
[   80.750052] Spurious APIC interrupt (vector 0xFF) on CPU#9, should neve=
r happen.
[   80.750621] CPU9 is up
[   80.750640] smpboot: Booting Node 0 Processor 10 APIC 0x5
[   80.752768] Spurious APIC interrupt (vector 0xFF) on CPU#10, should nev=
er happen.
[   80.753471] CPU10 is up
[   80.753512] smpboot: Booting Node 0 Processor 11 APIC 0x7
[   80.755644] Spurious APIC interrupt (vector 0xFF) on CPU#11, should nev=
er happen.
[   80.756294] CPU11 is up
[   80.756321] smpboot: Booting Node 0 Processor 12 APIC 0x9
[   80.758448] Spurious APIC interrupt (vector 0xFF) on CPU#12, should nev=
er happen.
[   80.759039] CPU12 is up
[   80.759063] smpboot: Booting Node 0 Processor 13 APIC 0xb
[   80.761195] Spurious APIC interrupt (vector 0xFF) on CPU#13, should nev=
er happen.
[   80.761970] CPU13 is up
[   80.761994] smpboot: Booting Node 0 Processor 14 APIC 0xd
[   80.764125] Spurious APIC interrupt (vector 0xFF) on CPU#14, should nev=
er happen.
[   80.764770] CPU14 is up
[   80.764810] smpboot: Booting Node 0 Processor 15 APIC 0xf
[   80.766944] Spurious APIC interrupt (vector 0xFF) on CPU#15, should nev=
er happen.
[   80.767543] CPU15 is up
[   80.769446] ACPI: PM: Waking up from system sleep state S3
[   81.185815] thunderbolt 0000:71:00.0: control channel starting...
[   81.185819] thunderbolt 0000:71:00.0: starting TX ring 0
[   81.185826] thunderbolt 0000:71:00.0: enabling interrupt at register 0x=
38200 bit 0 (0x0 -> 0x1)
[   81.185829] thunderbolt 0000:71:00.0: starting RX ring 0
[   81.185835] thunderbolt 0000:71:00.0: enabling interrupt at register 0x=
38200 bit 21 (0x1 -> 0x200001)
[   81.185842] thunderbolt 0000:71:00.0: resuming...
[   81.185844] thunderbolt 0000:71:00.0: 0: resuming switch
[   81.185845] thunderbolt 0000:71:00.0: restoring Switch at 0x0 (depth: 0=
, up port: 5)
[   81.185955] thunderbolt 0000:71:00.0: acking hot plug event on 0:1
[   81.186915] thunderbolt 0000:71:00.0: acking hot plug event on 0:2
[   81.186927] thunderbolt 0000:71:00.0: 0:1: USB4 wake: no, connection wa=
ke: no, disconnection wake: no
[   81.187711] thunderbolt 0000:71:00.0: 0:3: USB4 wake: no, connection wa=
ke: no, disconnection wake: no
[   81.187712] thunderbolt 0000:71:00.0: 0: disabling wakeup
[   81.190746] thunderbolt 0000:71:00.0: 0: TMU: supports uni-directional =
mode
[   81.190825] thunderbolt 0000:71:00.0: 0: TMU: current mode: off
[   81.190904] thunderbolt 0000:71:00.0: 0:1: is connected, link is up (st=
ate: 2)
[   81.191066] thunderbolt 0000:71:00.0: 1: resuming switch
[   81.191167] thunderbolt 0000:71:00.0: restoring Switch at 0x1 (depth: 1=
, up port: 1)
[   81.191374] thunderbolt 0000:71:00.0: 1: link: USB4
[   81.191376] thunderbolt 0000:71:00.0: 1: TBT3 support: yes, xHCI: no
[   81.191591] thunderbolt 0000:71:00.0: 1: PCIe wake: no, USB3 wake: no
[   81.191645] thunderbolt 0000:71:00.0: 1:1: USB4 wake: yes, connection w=
ake: no, disconnection wake: no
[   81.191700] thunderbolt 0000:71:00.0: 1:3: USB4 wake: no, connection wa=
ke: no, disconnection wake: no
[   81.191703] thunderbolt 0000:71:00.0: 1: disabling wakeup
[   81.194537] thunderbolt 0000:71:00.0: 1: TMU: supports uni-directional =
mode
[   81.194637] thunderbolt 0000:71:00.0: 1: TMU: current mode: off
[   81.194643] thunderbolt 0000:71:00.0: 0: TMU: mode change off -> bi-dir=
ectional, HiFi requested
[   81.194963] thunderbolt 0000:71:00.0: 0: TMU: mode set to: bi-direction=
al, HiFi
[   81.195848] thunderbolt 0000:71:00.0: 0:10: DP IN resource available
[   81.196391] thunderbolt 0000:71:00.0: 0:11: DP IN resource available
[   81.196661] thunderbolt 0000:71:00.0: 0:2: is connected, link is up (st=
ate: 2)
[   81.198119] thunderbolt 0000:71:00.0: 0:2: total credits changed 174 ->=
 174
[   81.198318] thunderbolt 0000:71:00.0: 1: link width set to symmetric, d=
ual lanes
[   81.198421] thunderbolt 0000:71:00.0: acking hot unplug event on 0:2
[   81.199649] thunderbolt 0000:71:00.0: 1:1: CLx: CL0s/CL1 supported
[   81.199651] thunderbolt 0000:71:00.0: 0:1: CLx: CL0s/CL1 not supported
[   81.199654] thunderbolt 0000:71:00.0: 1: TMU: mode change off -> bi-dir=
ectional, HiFi requested
[   81.199734] thunderbolt 0000:71:00.0: 0: TMU: local_time[0]=3D0x803d400=
0
[   81.199737] thunderbolt 0000:71:00.0: 0: TMU: local_time[1]=3D0x0000915=
7
[   81.199739] thunderbolt 0000:71:00.0: 0: TMU: local_time[2]=3D0x0010000=
0
[   81.200094] thunderbolt 0000:71:00.0: 1: TMU: updated local time to 0x9=
157803d
[   81.200572] thunderbolt 0000:71:00.0: acking hot plug event on 1:13
[   81.201753] thunderbolt 0000:71:00.0: 1: TMU: mode set to: bi-direction=
al, HiFi
[   81.202706] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): activating
[   81.202709] thunderbolt 0000:71:00.0: deactivating USB3 Down path from =
0:8 to 1:16
[   81.202846] thunderbolt 0000:71:00.0: deactivating USB3 Up path from 1:=
16 to 0:8
[   81.202977] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): allocating i=
nitial bandwidth 9000/9000 Mb/s
[   81.203479] thunderbolt 0000:71:00.0: 0:8: scaled bandwidth 2198/2198, =
scale 0
[   81.203912] thunderbolt 0000:71:00.0: activating USB3 Down path from 0:=
8 to 1:16
[   81.204064] thunderbolt 0000:71:00.0: 0:8: Writing hop 0
[   81.204067] thunderbolt 0000:71:00.0: 0:8:  In HopID: 8 =3D> Out port: =
1 Out HopID: 8
[   81.204069] thunderbolt 0000:71:00.0: 0:8:   Weight: 2 Priority: 3 Cred=
its: 0 Drop: 0 PM: 0
[   81.204072] thunderbolt 0000:71:00.0: 0:8:    Counter enabled: 0 Counte=
r index: 2047
[   81.204075] thunderbolt 0000:71:00.0: 0:8:   Flow Control (In/Eg): 0/1 =
Shared Buffer (In/Eg): 0/0
[   81.204077] thunderbolt 0000:71:00.0: 0:8:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[   81.204277] thunderbolt 0000:71:00.0: 1:1: Writing hop 1
[   81.204279] thunderbolt 0000:71:00.0: 1:1:  In HopID: 8 =3D> Out port: =
16 Out HopID: 8
[   81.204281] thunderbolt 0000:71:00.0: 1:1:   Weight: 2 Priority: 3 Cred=
its: 14 Drop: 0 PM: 0
[   81.204284] thunderbolt 0000:71:00.0: 1:1:    Counter enabled: 0 Counte=
r index: 2047
[   81.204286] thunderbolt 0000:71:00.0: 1:1:   Flow Control (In/Eg): 1/0 =
Shared Buffer (In/Eg): 0/0
[   81.204289] thunderbolt 0000:71:00.0: 1:1:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[   81.204347] thunderbolt 0000:71:00.0: USB3 Down path activation complet=
e
[   81.204349] thunderbolt 0000:71:00.0: activating USB3 Up path from 1:16=
 to 0:8
[   81.204456] thunderbolt 0000:71:00.0: 1:16: Writing hop 0
[   81.204459] thunderbolt 0000:71:00.0: 1:16:  In HopID: 8 =3D> Out port:=
 1 Out HopID: 8
[   81.204461] thunderbolt 0000:71:00.0: 1:16:   Weight: 2 Priority: 3 Cre=
dits: 2 Drop: 0 PM: 0
[   81.204464] thunderbolt 0000:71:00.0: 1:16:    Counter enabled: 0 Count=
er index: 2047
[   81.204466] thunderbolt 0000:71:00.0: 1:16:   Flow Control (In/Eg): 1/1=
 Shared Buffer (In/Eg): 0/0
[   81.204468] thunderbolt 0000:71:00.0: 1:16:   Unknown1: 0x0 Unknown2: 0=
x0 Unknown3: 0x0
[   81.204697] thunderbolt 0000:71:00.0: 0:1: Writing hop 1
[   81.204699] thunderbolt 0000:71:00.0: 0:1:  In HopID: 8 =3D> Out port: =
8 Out HopID: 8
[   81.204701] thunderbolt 0000:71:00.0: 0:1:   Weight: 2 Priority: 3 Cred=
its: 64 Drop: 0 PM: 0
[   81.204704] thunderbolt 0000:71:00.0: 0:1:    Counter enabled: 0 Counte=
r index: 2047
[   81.204706] thunderbolt 0000:71:00.0: 0:1:   Flow Control (In/Eg): 1/0 =
Shared Buffer (In/Eg): 0/0
[   81.204708] thunderbolt 0000:71:00.0: 0:1:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[   81.204805] thunderbolt 0000:71:00.0: USB3 Up path activation complete
[   81.204963] thunderbolt 0000:71:00.0: 0:6 <-> 1:9 (PCI): activating
[   81.204966] thunderbolt 0000:71:00.0: deactivating PCIe Down path from =
0:6 to 1:9
[   81.205101] thunderbolt 0000:71:00.0: deactivating PCIe Up path from 1:=
9 to 0:6
[   81.205360] thunderbolt 0000:71:00.0: activating PCIe Down path from 0:=
6 to 1:9
[   81.205518] thunderbolt 0000:71:00.0: 0:6: Writing hop 0
[   81.205520] thunderbolt 0000:71:00.0: 0:6:  In HopID: 8 =3D> Out port: =
1 Out HopID: 11
[   81.205523] thunderbolt 0000:71:00.0: 0:6:   Weight: 1 Priority: 3 Cred=
its: 0 Drop: 0 PM: 0
[   81.205525] thunderbolt 0000:71:00.0: 0:6:    Counter enabled: 0 Counte=
r index: 2047
[   81.205527] thunderbolt 0000:71:00.0: 0:6:   Flow Control (In/Eg): 0/1 =
Shared Buffer (In/Eg): 0/0
[   81.205530] thunderbolt 0000:71:00.0: 0:6:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[   81.205758] thunderbolt 0000:71:00.0: 1:1: Writing hop 1
[   81.205760] thunderbolt 0000:71:00.0: 1:1:  In HopID: 11 =3D> Out port:=
 9 Out HopID: 8
[   81.205763] thunderbolt 0000:71:00.0: 1:1:   Weight: 1 Priority: 3 Cred=
its: 32 Drop: 0 PM: 0
[   81.205765] thunderbolt 0000:71:00.0: 1:1:    Counter enabled: 0 Counte=
r index: 2047
[   81.205768] thunderbolt 0000:71:00.0: 1:1:   Flow Control (In/Eg): 1/0 =
Shared Buffer (In/Eg): 0/0
[   81.205770] thunderbolt 0000:71:00.0: 1:1:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[   81.205831] thunderbolt 0000:71:00.0: PCIe Down path activation complet=
e
[   81.205833] thunderbolt 0000:71:00.0: activating PCIe Up path from 1:9 =
to 0:6
[   81.205939] thunderbolt 0000:71:00.0: 1:9: Writing hop 0
[   81.205941] thunderbolt 0000:71:00.0: 1:9:  In HopID: 8 =3D> Out port: =
1 Out HopID: 10
[   81.205944] thunderbolt 0000:71:00.0: 1:9:   Weight: 1 Priority: 3 Cred=
its: 7 Drop: 0 PM: 0
[   81.205946] thunderbolt 0000:71:00.0: 1:9:    Counter enabled: 0 Counte=
r index: 2047
[   81.205948] thunderbolt 0000:71:00.0: 1:9:   Flow Control (In/Eg): 1/1 =
Shared Buffer (In/Eg): 0/0
[   81.205950] thunderbolt 0000:71:00.0: 1:9:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[   81.206156] thunderbolt 0000:71:00.0: 0:1: Writing hop 1
[   81.206157] thunderbolt 0000:71:00.0: 0:1:  In HopID: 10 =3D> Out port:=
 6 Out HopID: 8
[   81.206159] thunderbolt 0000:71:00.0: 0:1:   Weight: 1 Priority: 3 Cred=
its: 64 Drop: 0 PM: 0
[   81.206160] thunderbolt 0000:71:00.0: 0:1:    Counter enabled: 0 Counte=
r index: 2047
[   81.206161] thunderbolt 0000:71:00.0: 0:1:   Flow Control (In/Eg): 1/0 =
Shared Buffer (In/Eg): 0/0
[   81.206163] thunderbolt 0000:71:00.0: 0:1:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[   81.206254] thunderbolt 0000:71:00.0: PCIe Up path activation complete
[   81.206398] thunderbolt 0000:71:00.0: tunnels restarted, sleeping for 1=
00ms
[   81.315461] thunderbolt 0000:71:00.0: resume finished
[   81.315490] thunderbolt 0000:71:00.0: 0:1: got plug event for connected=
 port, ignoring
[   81.315511] thunderbolt 0000:71:00.0: 0:2: got plug event for connected=
 port, ignoring
[   81.315517] thunderbolt 0000:71:00.0: 0:2: got unplug event for disconn=
ected port, ignoring
[   81.315644] thunderbolt 0000:71:00.0: 1:13: DP OUT resource available a=
fter hotplug
[   81.315651] thunderbolt 0000:71:00.0: looking for DP IN <-> DP OUT pair=
s:
[   81.315763] thunderbolt 0000:71:00.0: 0:10: DP IN available
[   81.315860] thunderbolt 0000:71:00.0: 1:13: DP OUT available
[   81.316400] thunderbolt 0000:71:00.0: 0: allocated DP resource for port=
 10
[   81.316406] thunderbolt 0000:71:00.0: 0:10: attached to bandwidth group=
 1
[   81.316945] thunderbolt 0000:71:00.0: 0:8: scaled bandwidth 220/220, sc=
ale 0
[   81.317359] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): decreased ba=
ndwidth allocation to 900/900 Mb/s
[   81.317614] thunderbolt 0000:71:00.0: 0:1: link maximum bandwidth 36000=
/36000 Mb/s
[   81.317669] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): consumed ban=
dwidth 1350/1350 Mb/s
[   81.317804] thunderbolt 0000:71:00.0: 1:1: link maximum bandwidth 36000=
/36000 Mb/s
[   81.317858] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): consumed ban=
dwidth 1350/1350 Mb/s
[   81.317913] thunderbolt 0000:71:00.0: available bandwidth for new DP tu=
nnel 34650/34650 Mb/s
[   81.317921] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): activating
[   81.318272] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): DP IN maximum=
 supported bandwidth 8100 Mb/s x4 =3D 25920 Mb/s
[   81.318275] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): DP OUT maximu=
m supported bandwidth 8100 Mb/s x4 =3D 25920 Mb/s
[   81.318442] thunderbolt 0000:71:00.0: activating Video path from 0:10 t=
o 1:13
[   81.318445] thunderbolt 0000:71:00.0: 1:1: adding 18 NFC credits to 0
[   81.318673] thunderbolt 0000:71:00.0: 0:10: Writing hop 0
[   81.318676] thunderbolt 0000:71:00.0: 0:10:  In HopID: 9 =3D> Out port:=
 1 Out HopID: 9
[   81.318679] thunderbolt 0000:71:00.0: 0:10:   Weight: 1 Priority: 1 Cre=
dits: 0 Drop: 0 PM: 0
[   81.318682] thunderbolt 0000:71:00.0: 0:10:    Counter enabled: 0 Count=
er index: 2047
[   81.318685] thunderbolt 0000:71:00.0: 0:10:   Flow Control (In/Eg): 0/0=
 Shared Buffer (In/Eg): 0/0
[   81.318687] thunderbolt 0000:71:00.0: 0:10:   Unknown1: 0x0 Unknown2: 0=
x0 Unknown3: 0x0
[   81.318890] thunderbolt 0000:71:00.0: 1:1: Writing hop 1
[   81.318893] thunderbolt 0000:71:00.0: 1:1:  In HopID: 9 =3D> Out port: =
13 Out HopID: 9
[   81.318895] thunderbolt 0000:71:00.0: 1:1:   Weight: 1 Priority: 1 Cred=
its: 0 Drop: 0 PM: 0
[   81.318898] thunderbolt 0000:71:00.0: 1:1:    Counter enabled: 0 Counte=
r index: 2047
[   81.318900] thunderbolt 0000:71:00.0: 1:1:   Flow Control (In/Eg): 0/0 =
Shared Buffer (In/Eg): 0/0
[   81.318903] thunderbolt 0000:71:00.0: 1:1:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[   81.318964] thunderbolt 0000:71:00.0: Video path activation complete
[   81.318966] thunderbolt 0000:71:00.0: activating AUX TX path from 0:10 =
to 1:13
[   81.319124] thunderbolt 0000:71:00.0: 0:10: Writing hop 0
[   81.319127] thunderbolt 0000:71:00.0: 0:10:  In HopID: 8 =3D> Out port:=
 1 Out HopID: 10
[   81.319129] thunderbolt 0000:71:00.0: 0:10:   Weight: 1 Priority: 2 Cre=
dits: 0 Drop: 0 PM: 0
[   81.319132] thunderbolt 0000:71:00.0: 0:10:    Counter enabled: 0 Count=
er index: 2047
[   81.319134] thunderbolt 0000:71:00.0: 0:10:   Flow Control (In/Eg): 0/1=
 Shared Buffer (In/Eg): 0/0
[   81.319137] thunderbolt 0000:71:00.0: 0:10:   Unknown1: 0x0 Unknown2: 0=
x0 Unknown3: 0x0
[   81.319331] thunderbolt 0000:71:00.0: 1:1: Writing hop 1
[   81.319333] thunderbolt 0000:71:00.0: 1:1:  In HopID: 10 =3D> Out port:=
 13 Out HopID: 8
[   81.319336] thunderbolt 0000:71:00.0: 1:1:   Weight: 1 Priority: 2 Cred=
its: 1 Drop: 0 PM: 0
[   81.319338] thunderbolt 0000:71:00.0: 1:1:    Counter enabled: 0 Counte=
r index: 2047
[   81.319341] thunderbolt 0000:71:00.0: 1:1:   Flow Control (In/Eg): 1/0 =
Shared Buffer (In/Eg): 0/0
[   81.319343] thunderbolt 0000:71:00.0: 1:1:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[   81.319399] thunderbolt 0000:71:00.0: AUX TX path activation complete
[   81.319401] thunderbolt 0000:71:00.0: activating AUX RX path from 1:13 =
to 0:10
[   81.319509] thunderbolt 0000:71:00.0: 1:13: Writing hop 0
[   81.319511] thunderbolt 0000:71:00.0: 1:13:  In HopID: 8 =3D> Out port:=
 1 Out HopID: 9
[   81.319514] thunderbolt 0000:71:00.0: 1:13:   Weight: 1 Priority: 2 Cre=
dits: 8 Drop: 0 PM: 0
[   81.319516] thunderbolt 0000:71:00.0: 1:13:    Counter enabled: 0 Count=
er index: 2047
[   81.319518] thunderbolt 0000:71:00.0: 1:13:   Flow Control (In/Eg): 1/1=
 Shared Buffer (In/Eg): 0/0
[   81.319521] thunderbolt 0000:71:00.0: 1:13:   Unknown1: 0x0 Unknown2: 0=
x0 Unknown3: 0x0
[   81.319753] thunderbolt 0000:71:00.0: 0:1: Writing hop 1
[   81.319755] thunderbolt 0000:71:00.0: 0:1:  In HopID: 9 =3D> Out port: =
10 Out HopID: 8
[   81.319757] thunderbolt 0000:71:00.0: 0:1:   Weight: 1 Priority: 2 Cred=
its: 2 Drop: 0 PM: 0
[   81.319760] thunderbolt 0000:71:00.0: 0:1:    Counter enabled: 0 Counte=
r index: 2047
[   81.319762] thunderbolt 0000:71:00.0: 0:1:   Flow Control (In/Eg): 1/0 =
Shared Buffer (In/Eg): 0/0
[   81.319764] thunderbolt 0000:71:00.0: 0:1:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[   81.319862] thunderbolt 0000:71:00.0: AUX RX path activation complete
[   81.320239] thunderbolt 0000:71:00.0: 0:11: DP IN available
[   81.320290] thunderbolt 0000:71:00.0: 1:13: DP OUT in use
[   81.320292] thunderbolt 0000:71:00.0: 0:11: no suitable DP OUT adapter =
available, not tunneling
[   81.345483] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): DPRX read tim=
eout
[   81.430435] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): DPRX read tim=
eout
[   81.488585] pcieport 0000:00:02.2: PME: Spurious native interrupt!
[   81.489545] pci 0000:00:00.0: enhanced atomics disabled
[   81.491122] amdgpu 0000:72:00.0: [drm] PCIE GART of 512M enabled (table=
 at 0x000000807FD00000).
[   81.491149] amdgpu 0000:72:00.0: PSP is resuming...
[   81.492067] nvme nvme0: D3 entry latency set to 10 seconds
[   81.496793] nvme nvme0: 16/0/0 default/read/poll queues
[   81.510338] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): DPRX read tim=
eout
[   81.515138] amdgpu 0000:72:00.0: reserve 0x4a00000 from 0x8070000000 fo=
r PSP TMR
[   81.590428] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): DPRX read tim=
eout
[   81.670517] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): DPRX read tim=
eout
[   81.750635] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): DPRX read tim=
eout
[   81.817008] ata3: SATA link down (SStatus 0 SControl 300)
[   81.817137] ata1: SATA link down (SStatus 0 SControl 300)
[   81.817233] ata4: SATA link down (SStatus 0 SControl 300)
[   81.830289] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): DPRX read tim=
eout
[   81.910358] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): DPRX read tim=
eout
[   81.975164] ata2: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[   81.981717] sd 1:0:0:0: [sda] Starting disk
[   81.988257] ata2.00: configured for UDMA/133
[   81.990162] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): DPRX read tim=
eout
[   82.070471] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): DPRX read tim=
eout
[   82.143384] amdgpu 0000:72:00.0: RAS: optional ras ta ucode is not avai=
lable
[   82.150192] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): DPRX read tim=
eout
[   82.151533] amdgpu 0000:72:00.0: RAP: optional rap ta ucode is not avai=
lable
[   82.151535] amdgpu 0000:72:00.0: SECUREDISPLAY: optional securedisplay =
ta ucode is not available
[   82.151538] amdgpu 0000:72:00.0: SMU is resuming...
[   82.177138] amdgpu 0000:72:00.0: SMU is resumed successfully!
[   82.184347] amdgpu 0000:72:00.0: [drm] DMUB hardware initialized: versi=
on=3D0x08006500
[   82.230478] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): DPRX read tim=
eout
[   82.286331] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): DPRX capabili=
ties read completed
[   82.286604] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): consumed band=
width 0/17280 Mb/s
[   82.286613] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): reclaiming u=
nused bandwidth
[   82.286824] thunderbolt 0000:71:00.0: 0:1: link maximum bandwidth 36000=
/36000 Mb/s
[   82.287127] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): consumed band=
width 0/17280 Mb/s
[   82.287167] thunderbolt 0000:71:00.0: 1:1: link maximum bandwidth 36000=
/36000 Mb/s
[   82.287398] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): consumed band=
width 0/17280 Mb/s
[   82.287401] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): available ba=
ndwidth 36000/18720 Mb/s
[   82.287971] thunderbolt 0000:71:00.0: 0:8: scaled bandwidth 2198/2198, =
scale 0
[   82.288344] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): increased ba=
ndwidth allocation to 9000/9000 Mb/s
[   82.288348] thunderbolt 0000:71:00.0: bandwidth consumption changed, re=
-calculating estimated bandwidth
[   82.288351] thunderbolt 0000:71:00.0: re-calculating bandwidth estimati=
on for group 1
[   82.288417] thunderbolt 0000:71:00.0: bandwidth estimation for group 1 =
done
[   82.288420] thunderbolt 0000:71:00.0: bandwidth re-calculation done
[   82.459958] amdgpu 0000:72:00.0: ring gfx_0.0.0 uses VM inv eng 0 on hu=
b 0
[   82.459963] amdgpu 0000:72:00.0: ring gfx_0.1.0 uses VM inv eng 1 on hu=
b 0
[   82.459966] amdgpu 0000:72:00.0: ring comp_1.0.0 uses VM inv eng 4 on h=
ub 0
[   82.459969] amdgpu 0000:72:00.0: ring comp_1.1.0 uses VM inv eng 6 on h=
ub 0
[   82.459972] amdgpu 0000:72:00.0: ring comp_1.2.0 uses VM inv eng 7 on h=
ub 0
[   82.459975] amdgpu 0000:72:00.0: ring comp_1.3.0 uses VM inv eng 8 on h=
ub 0
[   82.459977] amdgpu 0000:72:00.0: ring comp_1.0.1 uses VM inv eng 9 on h=
ub 0
[   82.459978] amdgpu 0000:72:00.0: ring comp_1.1.1 uses VM inv eng 10 on =
hub 0
[   82.459980] amdgpu 0000:72:00.0: ring comp_1.2.1 uses VM inv eng 11 on =
hub 0
[   82.459981] amdgpu 0000:72:00.0: ring comp_1.3.1 uses VM inv eng 12 on =
hub 0
[   82.459983] amdgpu 0000:72:00.0: ring sdma0 uses VM inv eng 13 on hub 0
[   82.459985] amdgpu 0000:72:00.0: ring vcn_unified_0 uses VM inv eng 0 o=
n hub 8
[   82.459987] amdgpu 0000:72:00.0: ring jpeg_dec uses VM inv eng 1 on hub=
 8
[   82.459988] amdgpu 0000:72:00.0: ring mes_kiq_3.1.0 uses VM inv eng 14 =
on hub 0
[   82.471694] PM: resume devices took 0.980 seconds
[   82.474750] OOM killer enabled.
[   82.474751] Restarting tasks: Starting
[   82.476250] Restarting tasks: Done
[   82.476267] efivarfs: resyncing variable state
[   82.476343] xhci_hcd 0000:70:00.0: bad transfer trb length 4 in event t=
rb
[   82.476511] xhci_hcd 0000:70:00.0: bad transfer trb length 4 in event t=
rb
[   82.481429] efivarfs: finished resyncing variable state
[   82.500898] PM: suspend exit
[   82.503856] xhci_hcd 0000:70:00.0: bad transfer trb length 4 in event t=
rb
[   82.605149] r8169 0000:05:00.0 enp5s0: PHY [r8169-0-500:00] driver [Rea=
ltek Internal NBASE-T PHY] (irq=3DMAC)
[   89.331972] r8169 0000:05:00.0 enp5s0: configuring for phy/internal lin=
k mode
[   92.423513] r8169 0000:05:00.0 enp5s0: Link is Up - 1Gbps/Full - flow c=
ontrol off
[  102.735278] input: M720 Triathlon Keyboard as /devices/virtual/misc/uhi=
d/0005:046D:B015.0008/input/input17
[  102.735449] input: M720 Triathlon Mouse as /devices/virtual/misc/uhid/0=
005:046D:B015.0008/input/input18
[  102.735603] hid-generic 0005:046D:B015.0008: input,hidraw6: BLUETOOTH H=
ID v0.13 Keyboard [M720 Triathlon] on 44:fa:66:66:18:84
[  102.857810] elogind-daemon[2633]: Watching system buttons on /dev/input=
/event14 (M720 Triathlon Keyboard)
[  136.090654] elogind-daemon[2633]: The system will suspend now!
[  136.299027] r8169 0000:05:00.0 enp5s0: Link is Down
[  136.337870] PM: suspend entry (deep)
[  136.355699] Filesystems sync: 0.017 seconds
[  136.366632] Freezing user space processes
[  136.429922] Freezing user space processes completed (elapsed 0.063 seco=
nds)
[  136.429933] OOM killer disabled.
[  136.429936] Freezing remaining freezable tasks
[  136.431157] Freezing remaining freezable tasks completed (elapsed 0.001=
 seconds)
[  136.431188] printk: Suspending console(s) (use no_console_suspend to de=
bug)
[  136.434731] Bluetooth: hci0: ACL packet for unknown connection handle 5=
12
[  136.504774] sd 1:0:0:0: [sda] Synchronizing SCSI cache
[  136.505125] ata2.00: Entering standby power mode
[  136.545589] xhci_hcd 0000:70:00.0: bad transfer trb length 4 in event t=
rb
[  136.546336] xhci_hcd 0000:70:00.0: bad transfer trb length 4 in event t=
rb
[  136.564807] xhci_hcd 0000:70:00.0: bad transfer trb length 4 in event t=
rb
[  136.584945] xhci_hcd 0000:70:00.0: bad transfer trb length 4 in event t=
rb
[  138.212725] PM: suspend devices took 1.780 seconds
[  138.410155] thunderbolt 0000:71:00.0: suspending...
[  138.410160] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): deactivating
[  138.410824] thunderbolt 0000:71:00.0: deactivating Video path from 0:10=
 to 1:13
[  138.411330] thunderbolt 0000:71:00.0: 1:1: adding -18 NFC credits to 18
[  138.411407] thunderbolt 0000:71:00.0: deactivating AUX TX path from 0:1=
0 to 1:13
[  138.411812] thunderbolt 0000:71:00.0: deactivating AUX RX path from 1:1=
3 to 0:10
[  138.412285] thunderbolt 0000:71:00.0: 0:10: detached from bandwidth gro=
up 1
[  138.412672] thunderbolt 0000:71:00.0: 0: released DP resource for port =
10
[  138.412675] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): reclaiming u=
nused bandwidth
[  138.412889] thunderbolt 0000:71:00.0: 0:1: link maximum bandwidth 36000=
/36000 Mb/s
[  138.413017] thunderbolt 0000:71:00.0: 1:1: link maximum bandwidth 36000=
/36000 Mb/s
[  138.413069] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): available ba=
ndwidth 36000/36000 Mb/s
[  138.413202] thunderbolt 0000:71:00.0: 0: suspending switch
[  138.413205] thunderbolt 0000:71:00.0: 1: suspending switch
[  138.413207] thunderbolt 0000:71:00.0: 1: enabling wakeup: 0x1f
[  138.413838] thunderbolt 0000:71:00.0: 0: enabling wakeup: 0x1f
[  138.415084] thunderbolt 0000:71:00.0: suspend finished
[  138.415086] thunderbolt 0000:71:00.0: stopping RX ring 0
[  138.415091] thunderbolt 0000:71:00.0: disabling interrupt at register 0=
x38200 bit 21 (0x200001 -> 0x1)
[  138.415106] thunderbolt 0000:71:00.0: stopping TX ring 0
[  138.415110] thunderbolt 0000:71:00.0: disabling interrupt at register 0=
x38200 bit 0 (0x1 -> 0x0)
[  138.415121] thunderbolt 0000:71:00.0: control channel stopped
[  138.600959] ACPI: PM: Preparing to enter system sleep state S3
[  138.911382] ACPI: PM: Saving platform NVS memory
[  138.911818] Disabling non-boot CPUs ...
[  138.913852] smpboot: CPU 15 is now offline
[  138.915858] smpboot: CPU 14 is now offline
[  138.917724] smpboot: CPU 13 is now offline
[  138.919537] smpboot: CPU 12 is now offline
[  138.921316] smpboot: CPU 11 is now offline
[  138.923105] smpboot: CPU 10 is now offline
[  138.924909] smpboot: CPU 9 is now offline
[  138.926806] smpboot: CPU 8 is now offline
[  138.927095] Spectre V2 : Update user space SMT mitigation: STIBP off
[  138.928545] smpboot: CPU 7 is now offline
[  138.930225] smpboot: CPU 6 is now offline
[  138.931901] smpboot: CPU 5 is now offline
[  138.933691] smpboot: CPU 4 is now offline
[  138.935723] smpboot: CPU 3 is now offline
[  138.937483] smpboot: CPU 2 is now offline
[  138.939257] smpboot: CPU 1 is now offline
[  138.940201] ACPI: PM: Low-level resume complete
[  138.940230] ACPI: PM: Restoring platform NVS memory
[  139.019655] AMD-Vi: Virtual APIC enabled
[  139.122008] AMD-Vi: Virtual APIC enabled
[  139.122054] LVT offset 0 assigned for vector 0x400
[  139.122592] Enabling non-boot CPUs ...
[  139.122635] smpboot: Booting Node 0 Processor 1 APIC 0x2
[  139.125309] CPU1 is up
[  139.125327] smpboot: Booting Node 0 Processor 2 APIC 0x4
[  139.128077] CPU2 is up
[  139.128107] smpboot: Booting Node 0 Processor 3 APIC 0x6
[  139.130728] CPU3 is up
[  139.130753] smpboot: Booting Node 0 Processor 4 APIC 0x8
[  139.133398] CPU4 is up
[  139.133421] smpboot: Booting Node 0 Processor 5 APIC 0xa
[  139.136050] CPU5 is up
[  139.136074] smpboot: Booting Node 0 Processor 6 APIC 0xc
[  139.138860] CPU6 is up
[  139.138883] smpboot: Booting Node 0 Processor 7 APIC 0xe
[  139.141533] CPU7 is up
[  139.141556] smpboot: Booting Node 0 Processor 8 APIC 0x1
[  139.144269] Spectre V2 : Update user space SMT mitigation: STIBP always=
-on
[  139.144307] CPU8 is up
[  139.144330] smpboot: Booting Node 0 Processor 9 APIC 0x3
[  139.146489] Spurious APIC interrupt (vector 0xFF) on CPU#9, should neve=
r happen.
[  139.147024] CPU9 is up
[  139.147045] smpboot: Booting Node 0 Processor 10 APIC 0x5
[  139.149179] Spurious APIC interrupt (vector 0xFF) on CPU#10, should nev=
er happen.
[  139.149848] CPU10 is up
[  139.149872] smpboot: Booting Node 0 Processor 11 APIC 0x7
[  139.152004] Spurious APIC interrupt (vector 0xFF) on CPU#11, should nev=
er happen.
[  139.152589] CPU11 is up
[  139.152613] smpboot: Booting Node 0 Processor 12 APIC 0x9
[  139.154740] Spurious APIC interrupt (vector 0xFF) on CPU#12, should nev=
er happen.
[  139.155300] CPU12 is up
[  139.155323] smpboot: Booting Node 0 Processor 13 APIC 0xb
[  139.157452] Spurious APIC interrupt (vector 0xFF) on CPU#13, should nev=
er happen.
[  139.158172] CPU13 is up
[  139.158199] smpboot: Booting Node 0 Processor 14 APIC 0xd
[  139.160338] Spurious APIC interrupt (vector 0xFF) on CPU#14, should nev=
er happen.
[  139.160982] CPU14 is up
[  139.161006] smpboot: Booting Node 0 Processor 15 APIC 0xf
[  139.163135] Spurious APIC interrupt (vector 0xFF) on CPU#15, should nev=
er happen.
[  139.163738] CPU15 is up
[  139.165731] ACPI: PM: Waking up from system sleep state S3
[  139.577860] thunderbolt 0000:71:00.0: control channel starting...
[  139.577864] thunderbolt 0000:71:00.0: starting TX ring 0
[  139.577871] thunderbolt 0000:71:00.0: enabling interrupt at register 0x=
38200 bit 0 (0x0 -> 0x1)
[  139.577874] thunderbolt 0000:71:00.0: starting RX ring 0
[  139.577880] thunderbolt 0000:71:00.0: enabling interrupt at register 0x=
38200 bit 21 (0x1 -> 0x200001)
[  139.577887] thunderbolt 0000:71:00.0: resuming...
[  139.577889] thunderbolt 0000:71:00.0: 0: resuming switch
[  139.577890] thunderbolt 0000:71:00.0: restoring Switch at 0x0 (depth: 0=
, up port: 5)
[  139.578000] thunderbolt 0000:71:00.0: acking hot plug event on 0:1
[  139.578897] thunderbolt 0000:71:00.0: acking hot plug event on 0:2
[  139.578984] thunderbolt 0000:71:00.0: 0:1: USB4 wake: no, connection wa=
ke: no, disconnection wake: no
[  139.580250] thunderbolt 0000:71:00.0: 0:3: USB4 wake: no, connection wa=
ke: no, disconnection wake: no
[  139.580255] thunderbolt 0000:71:00.0: 0: disabling wakeup
[  139.583317] thunderbolt 0000:71:00.0: 0: TMU: supports uni-directional =
mode
[  139.583394] thunderbolt 0000:71:00.0: 0: TMU: current mode: off
[  139.583469] thunderbolt 0000:71:00.0: 0:1: is connected, link is up (st=
ate: 2)
[  139.583629] thunderbolt 0000:71:00.0: 1: resuming switch
[  139.583728] thunderbolt 0000:71:00.0: restoring Switch at 0x1 (depth: 1=
, up port: 1)
[  139.583921] thunderbolt 0000:71:00.0: 1: link: USB4
[  139.583924] thunderbolt 0000:71:00.0: 1: TBT3 support: yes, xHCI: no
[  139.584147] thunderbolt 0000:71:00.0: 1: PCIe wake: no, USB3 wake: no
[  139.584202] thunderbolt 0000:71:00.0: 1:1: USB4 wake: yes, connection w=
ake: no, disconnection wake: no
[  139.584256] thunderbolt 0000:71:00.0: 1:3: USB4 wake: no, connection wa=
ke: no, disconnection wake: no
[  139.584260] thunderbolt 0000:71:00.0: 1: disabling wakeup
[  139.587096] thunderbolt 0000:71:00.0: 1: TMU: supports uni-directional =
mode
[  139.587192] thunderbolt 0000:71:00.0: 1: TMU: current mode: off
[  139.587198] thunderbolt 0000:71:00.0: 0: TMU: mode change off -> bi-dir=
ectional, HiFi requested
[  139.587376] thunderbolt 0000:71:00.0: acking hot plug event on 1:13
[  139.588198] thunderbolt 0000:71:00.0: acking hot plug event on 1:2
[  139.588293] thunderbolt 0000:71:00.0: 0: TMU: mode set to: bi-direction=
al, HiFi
[  139.589687] thunderbolt 0000:71:00.0: 0:10: DP IN resource available
[  139.590099] thunderbolt 0000:71:00.0: 0:11: DP IN resource available
[  139.590378] thunderbolt 0000:71:00.0: 0:2: is connected, link is up (st=
ate: 2)
[  139.591603] thunderbolt 0000:71:00.0: acking hot unplug event on 1:2
[  139.592175] thunderbolt 0000:71:00.0: acking hot unplug event on 0:2
[  139.593266] thunderbolt 0000:71:00.0: 0:2: total credits changed 174 ->=
 174
[  139.593474] thunderbolt 0000:71:00.0: 1: link width set to symmetric, d=
ual lanes
[  139.594204] thunderbolt 0000:71:00.0: 1:1: CLx: CL0s/CL1 supported
[  139.594207] thunderbolt 0000:71:00.0: 0:1: CLx: CL0s/CL1 not supported
[  139.594209] thunderbolt 0000:71:00.0: 1: TMU: mode change off -> bi-dir=
ectional, HiFi requested
[  139.594298] thunderbolt 0000:71:00.0: 0: TMU: local_time[0]=3D0x6ea6400=
0
[  139.594301] thunderbolt 0000:71:00.0: 0: TMU: local_time[1]=3D0x0000976=
3
[  139.594303] thunderbolt 0000:71:00.0: 0: TMU: local_time[2]=3D0x0010000=
0
[  139.594658] thunderbolt 0000:71:00.0: 1: TMU: updated local time to 0x9=
7636ea6
[  139.595519] thunderbolt 0000:71:00.0: 1: TMU: mode set to: bi-direction=
al, HiFi
[  139.596454] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): activating
[  139.596457] thunderbolt 0000:71:00.0: deactivating USB3 Down path from =
0:8 to 1:16
[  139.596584] thunderbolt 0000:71:00.0: deactivating USB3 Up path from 1:=
16 to 0:8
[  139.596716] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): allocating i=
nitial bandwidth 9000/9000 Mb/s
[  139.597213] thunderbolt 0000:71:00.0: 0:8: scaled bandwidth 2198/2198, =
scale 0
[  139.597643] thunderbolt 0000:71:00.0: activating USB3 Down path from 0:=
8 to 1:16
[  139.597793] thunderbolt 0000:71:00.0: 0:8: Writing hop 0
[  139.597796] thunderbolt 0000:71:00.0: 0:8:  In HopID: 8 =3D> Out port: =
1 Out HopID: 8
[  139.597799] thunderbolt 0000:71:00.0: 0:8:   Weight: 2 Priority: 3 Cred=
its: 0 Drop: 0 PM: 0
[  139.597802] thunderbolt 0000:71:00.0: 0:8:    Counter enabled: 0 Counte=
r index: 2047
[  139.597804] thunderbolt 0000:71:00.0: 0:8:   Flow Control (In/Eg): 0/1 =
Shared Buffer (In/Eg): 0/0
[  139.597806] thunderbolt 0000:71:00.0: 0:8:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[  139.598012] thunderbolt 0000:71:00.0: 1:1: Writing hop 1
[  139.598014] thunderbolt 0000:71:00.0: 1:1:  In HopID: 8 =3D> Out port: =
16 Out HopID: 8
[  139.598017] thunderbolt 0000:71:00.0: 1:1:   Weight: 2 Priority: 3 Cred=
its: 14 Drop: 0 PM: 0
[  139.598020] thunderbolt 0000:71:00.0: 1:1:    Counter enabled: 0 Counte=
r index: 2047
[  139.598022] thunderbolt 0000:71:00.0: 1:1:   Flow Control (In/Eg): 1/0 =
Shared Buffer (In/Eg): 0/0
[  139.598024] thunderbolt 0000:71:00.0: 1:1:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[  139.598084] thunderbolt 0000:71:00.0: USB3 Down path activation complet=
e
[  139.598086] thunderbolt 0000:71:00.0: activating USB3 Up path from 1:16=
 to 0:8
[  139.598192] thunderbolt 0000:71:00.0: 1:16: Writing hop 0
[  139.598195] thunderbolt 0000:71:00.0: 1:16:  In HopID: 8 =3D> Out port:=
 1 Out HopID: 8
[  139.598197] thunderbolt 0000:71:00.0: 1:16:   Weight: 2 Priority: 3 Cre=
dits: 2 Drop: 0 PM: 0
[  139.598200] thunderbolt 0000:71:00.0: 1:16:    Counter enabled: 0 Count=
er index: 2047
[  139.598202] thunderbolt 0000:71:00.0: 1:16:   Flow Control (In/Eg): 1/1=
 Shared Buffer (In/Eg): 0/0
[  139.598204] thunderbolt 0000:71:00.0: 1:16:   Unknown1: 0x0 Unknown2: 0=
x0 Unknown3: 0x0
[  139.598418] thunderbolt 0000:71:00.0: 0:1: Writing hop 1
[  139.598420] thunderbolt 0000:71:00.0: 0:1:  In HopID: 8 =3D> Out port: =
8 Out HopID: 8
[  139.598422] thunderbolt 0000:71:00.0: 0:1:   Weight: 2 Priority: 3 Cred=
its: 64 Drop: 0 PM: 0
[  139.598426] thunderbolt 0000:71:00.0: 0:1:    Counter enabled: 0 Counte=
r index: 2047
[  139.598430] thunderbolt 0000:71:00.0: 0:1:   Flow Control (In/Eg): 1/0 =
Shared Buffer (In/Eg): 0/0
[  139.598434] thunderbolt 0000:71:00.0: 0:1:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[  139.598536] thunderbolt 0000:71:00.0: USB3 Up path activation complete
[  139.598694] thunderbolt 0000:71:00.0: 0:6 <-> 1:9 (PCI): activating
[  139.598697] thunderbolt 0000:71:00.0: deactivating PCIe Down path from =
0:6 to 1:9
[  139.598833] thunderbolt 0000:71:00.0: deactivating PCIe Up path from 1:=
9 to 0:6
[  139.599085] thunderbolt 0000:71:00.0: activating PCIe Down path from 0:=
6 to 1:9
[  139.599236] thunderbolt 0000:71:00.0: 0:6: Writing hop 0
[  139.599239] thunderbolt 0000:71:00.0: 0:6:  In HopID: 8 =3D> Out port: =
1 Out HopID: 11
[  139.599241] thunderbolt 0000:71:00.0: 0:6:   Weight: 1 Priority: 3 Cred=
its: 0 Drop: 0 PM: 0
[  139.599244] thunderbolt 0000:71:00.0: 0:6:    Counter enabled: 0 Counte=
r index: 2047
[  139.599246] thunderbolt 0000:71:00.0: 0:6:   Flow Control (In/Eg): 0/1 =
Shared Buffer (In/Eg): 0/0
[  139.599248] thunderbolt 0000:71:00.0: 0:6:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[  139.599453] thunderbolt 0000:71:00.0: 1:1: Writing hop 1
[  139.599455] thunderbolt 0000:71:00.0: 1:1:  In HopID: 11 =3D> Out port:=
 9 Out HopID: 8
[  139.599458] thunderbolt 0000:71:00.0: 1:1:   Weight: 1 Priority: 3 Cred=
its: 32 Drop: 0 PM: 0
[  139.599460] thunderbolt 0000:71:00.0: 1:1:    Counter enabled: 0 Counte=
r index: 2047
[  139.599462] thunderbolt 0000:71:00.0: 1:1:   Flow Control (In/Eg): 1/0 =
Shared Buffer (In/Eg): 0/0
[  139.599465] thunderbolt 0000:71:00.0: 1:1:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[  139.599522] thunderbolt 0000:71:00.0: PCIe Down path activation complet=
e
[  139.599524] thunderbolt 0000:71:00.0: activating PCIe Up path from 1:9 =
to 0:6
[  139.599628] thunderbolt 0000:71:00.0: 1:9: Writing hop 0
[  139.599630] thunderbolt 0000:71:00.0: 1:9:  In HopID: 8 =3D> Out port: =
1 Out HopID: 10
[  139.599631] thunderbolt 0000:71:00.0: 1:9:   Weight: 1 Priority: 3 Cred=
its: 7 Drop: 0 PM: 0
[  139.599633] thunderbolt 0000:71:00.0: 1:9:    Counter enabled: 0 Counte=
r index: 2047
[  139.599634] thunderbolt 0000:71:00.0: 1:9:   Flow Control (In/Eg): 1/1 =
Shared Buffer (In/Eg): 0/0
[  139.599635] thunderbolt 0000:71:00.0: 1:9:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[  139.599839] thunderbolt 0000:71:00.0: 0:1: Writing hop 1
[  139.599841] thunderbolt 0000:71:00.0: 0:1:  In HopID: 10 =3D> Out port:=
 6 Out HopID: 8
[  139.599842] thunderbolt 0000:71:00.0: 0:1:   Weight: 1 Priority: 3 Cred=
its: 64 Drop: 0 PM: 0
[  139.599844] thunderbolt 0000:71:00.0: 0:1:    Counter enabled: 0 Counte=
r index: 2047
[  139.599845] thunderbolt 0000:71:00.0: 0:1:   Flow Control (In/Eg): 1/0 =
Shared Buffer (In/Eg): 0/0
[  139.599846] thunderbolt 0000:71:00.0: 0:1:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[  139.599937] thunderbolt 0000:71:00.0: PCIe Up path activation complete
[  139.600081] thunderbolt 0000:71:00.0: tunnels restarted, sleeping for 1=
00ms
[  139.707417] thunderbolt 0000:71:00.0: resume finished
[  139.707471] thunderbolt 0000:71:00.0: 0:1: got plug event for connected=
 port, ignoring
[  139.707495] thunderbolt 0000:71:00.0: 0:2: got plug event for connected=
 port, ignoring
[  139.707629] thunderbolt 0000:71:00.0: 1:13: DP OUT resource available a=
fter hotplug
[  139.707635] thunderbolt 0000:71:00.0: looking for DP IN <-> DP OUT pair=
s:
[  139.707774] thunderbolt 0000:71:00.0: 0:10: DP IN available
[  139.707884] thunderbolt 0000:71:00.0: 1:13: DP OUT available
[  139.708448] thunderbolt 0000:71:00.0: 0: allocated DP resource for port=
 10
[  139.708454] thunderbolt 0000:71:00.0: 0:10: attached to bandwidth group=
 1
[  139.708996] thunderbolt 0000:71:00.0: 0:8: scaled bandwidth 220/220, sc=
ale 0
[  139.709419] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): decreased ba=
ndwidth allocation to 900/900 Mb/s
[  139.709667] thunderbolt 0000:71:00.0: 0:1: link maximum bandwidth 36000=
/36000 Mb/s
[  139.709723] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): consumed ban=
dwidth 1350/1350 Mb/s
[  139.709855] thunderbolt 0000:71:00.0: 1:1: link maximum bandwidth 36000=
/36000 Mb/s
[  139.709908] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): consumed ban=
dwidth 1350/1350 Mb/s
[  139.709964] thunderbolt 0000:71:00.0: available bandwidth for new DP tu=
nnel 34650/34650 Mb/s
[  139.709975] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): activating
[  139.710337] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): DP IN maximum=
 supported bandwidth 8100 Mb/s x4 =3D 25920 Mb/s
[  139.710341] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): DP OUT maximu=
m supported bandwidth 8100 Mb/s x4 =3D 25920 Mb/s
[  139.710513] thunderbolt 0000:71:00.0: activating Video path from 0:10 t=
o 1:13
[  139.710517] thunderbolt 0000:71:00.0: 1:1: adding 18 NFC credits to 0
[  139.710746] thunderbolt 0000:71:00.0: 0:10: Writing hop 0
[  139.710749] thunderbolt 0000:71:00.0: 0:10:  In HopID: 9 =3D> Out port:=
 1 Out HopID: 9
[  139.710752] thunderbolt 0000:71:00.0: 0:10:   Weight: 1 Priority: 1 Cre=
dits: 0 Drop: 0 PM: 0
[  139.710755] thunderbolt 0000:71:00.0: 0:10:    Counter enabled: 0 Count=
er index: 2047
[  139.710757] thunderbolt 0000:71:00.0: 0:10:   Flow Control (In/Eg): 0/0=
 Shared Buffer (In/Eg): 0/0
[  139.710760] thunderbolt 0000:71:00.0: 0:10:   Unknown1: 0x0 Unknown2: 0=
x0 Unknown3: 0x0
[  139.710970] thunderbolt 0000:71:00.0: 1:1: Writing hop 1
[  139.710973] thunderbolt 0000:71:00.0: 1:1:  In HopID: 9 =3D> Out port: =
13 Out HopID: 9
[  139.710975] thunderbolt 0000:71:00.0: 1:1:   Weight: 1 Priority: 1 Cred=
its: 0 Drop: 0 PM: 0
[  139.710978] thunderbolt 0000:71:00.0: 1:1:    Counter enabled: 0 Counte=
r index: 2047
[  139.710981] thunderbolt 0000:71:00.0: 1:1:   Flow Control (In/Eg): 0/0 =
Shared Buffer (In/Eg): 0/0
[  139.710983] thunderbolt 0000:71:00.0: 1:1:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[  139.711047] thunderbolt 0000:71:00.0: Video path activation complete
[  139.711049] thunderbolt 0000:71:00.0: activating AUX TX path from 0:10 =
to 1:13
[  139.711207] thunderbolt 0000:71:00.0: 0:10: Writing hop 0
[  139.711209] thunderbolt 0000:71:00.0: 0:10:  In HopID: 8 =3D> Out port:=
 1 Out HopID: 10
[  139.711212] thunderbolt 0000:71:00.0: 0:10:   Weight: 1 Priority: 2 Cre=
dits: 0 Drop: 0 PM: 0
[  139.711214] thunderbolt 0000:71:00.0: 0:10:    Counter enabled: 0 Count=
er index: 2047
[  139.711217] thunderbolt 0000:71:00.0: 0:10:   Flow Control (In/Eg): 0/1=
 Shared Buffer (In/Eg): 0/0
[  139.711219] thunderbolt 0000:71:00.0: 0:10:   Unknown1: 0x0 Unknown2: 0=
x0 Unknown3: 0x0
[  139.711422] thunderbolt 0000:71:00.0: 1:1: Writing hop 1
[  139.711424] thunderbolt 0000:71:00.0: 1:1:  In HopID: 10 =3D> Out port:=
 13 Out HopID: 8
[  139.711427] thunderbolt 0000:71:00.0: 1:1:   Weight: 1 Priority: 2 Cred=
its: 1 Drop: 0 PM: 0
[  139.711429] thunderbolt 0000:71:00.0: 1:1:    Counter enabled: 0 Counte=
r index: 2047
[  139.711431] thunderbolt 0000:71:00.0: 1:1:   Flow Control (In/Eg): 1/0 =
Shared Buffer (In/Eg): 0/0
[  139.711434] thunderbolt 0000:71:00.0: 1:1:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[  139.711495] thunderbolt 0000:71:00.0: AUX TX path activation complete
[  139.711497] thunderbolt 0000:71:00.0: activating AUX RX path from 1:13 =
to 0:10
[  139.711620] thunderbolt 0000:71:00.0: 1:13: Writing hop 0
[  139.711622] thunderbolt 0000:71:00.0: 1:13:  In HopID: 8 =3D> Out port:=
 1 Out HopID: 9
[  139.711625] thunderbolt 0000:71:00.0: 1:13:   Weight: 1 Priority: 2 Cre=
dits: 8 Drop: 0 PM: 0
[  139.711627] thunderbolt 0000:71:00.0: 1:13:    Counter enabled: 0 Count=
er index: 2047
[  139.711629] thunderbolt 0000:71:00.0: 1:13:   Flow Control (In/Eg): 1/1=
 Shared Buffer (In/Eg): 0/0
[  139.711632] thunderbolt 0000:71:00.0: 1:13:   Unknown1: 0x0 Unknown2: 0=
x0 Unknown3: 0x0
[  139.711847] thunderbolt 0000:71:00.0: 0:1: Writing hop 1
[  139.711849] thunderbolt 0000:71:00.0: 0:1:  In HopID: 9 =3D> Out port: =
10 Out HopID: 8
[  139.711851] thunderbolt 0000:71:00.0: 0:1:   Weight: 1 Priority: 2 Cred=
its: 2 Drop: 0 PM: 0
[  139.711854] thunderbolt 0000:71:00.0: 0:1:    Counter enabled: 0 Counte=
r index: 2047
[  139.711856] thunderbolt 0000:71:00.0: 0:1:   Flow Control (In/Eg): 1/0 =
Shared Buffer (In/Eg): 0/0
[  139.711859] thunderbolt 0000:71:00.0: 0:1:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[  139.711956] thunderbolt 0000:71:00.0: AUX RX path activation complete
[  139.712337] thunderbolt 0000:71:00.0: 0:11: DP IN available
[  139.712391] thunderbolt 0000:71:00.0: 1:13: DP OUT in use
[  139.712393] thunderbolt 0000:71:00.0: 0:11: no suitable DP OUT adapter =
available, not tunneling
[  139.712398] thunderbolt 0000:71:00.0: hotplug event for upstream port 1=
:2 (unplug: 0)
[  139.712401] thunderbolt 0000:71:00.0: hotplug event for upstream port 1=
:2 (unplug: 1)
[  139.712404] thunderbolt 0000:71:00.0: 0:2: got unplug event for disconn=
ected port, ignoring
[  139.737582] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): DPRX read tim=
eout
[  139.822474] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): DPRX read tim=
eout
[  139.891255] pci 0000:00:00.0: enhanced atomics disabled
[  139.892249] pcieport 0000:00:02.2: PME: Spurious native interrupt!
[  139.892728] amdgpu 0000:72:00.0: [drm] PCIE GART of 512M enabled (table=
 at 0x000000807FD00000).
[  139.892755] amdgpu 0000:72:00.0: PSP is resuming...
[  139.893648] nvme nvme0: D3 entry latency set to 10 seconds
[  139.898163] nvme nvme0: 16/0/0 default/read/poll queues
[  139.902213] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): DPRX read tim=
eout
[  139.916786] amdgpu 0000:72:00.0: reserve 0x4a00000 from 0x8070000000 fo=
r PSP TMR
[  139.982677] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): DPRX read tim=
eout
[  140.072477] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): DPRX read tim=
eout
[  140.152441] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): DPRX read tim=
eout
[  140.209650] ata4: SATA link down (SStatus 0 SControl 300)
[  140.209693] ata3: SATA link down (SStatus 0 SControl 300)
[  140.219490] ata1: SATA link down (SStatus 0 SControl 300)
[  140.232514] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): DPRX read tim=
eout
[  140.312259] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): DPRX read tim=
eout
[  140.367413] ata2: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[  140.373897] sd 1:0:0:0: [sda] Starting disk
[  140.380387] ata2.00: configured for UDMA/133
[  140.392188] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): DPRX read tim=
eout
[  140.472356] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): DPRX read tim=
eout
[  140.545962] amdgpu 0000:72:00.0: RAS: optional ras ta ucode is not avai=
lable
[  140.552343] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): DPRX read tim=
eout
[  140.554416] amdgpu 0000:72:00.0: RAP: optional rap ta ucode is not avai=
lable
[  140.554418] amdgpu 0000:72:00.0: SECUREDISPLAY: optional securedisplay =
ta ucode is not available
[  140.554421] amdgpu 0000:72:00.0: SMU is resuming...
[  140.579459] amdgpu 0000:72:00.0: SMU is resumed successfully!
[  140.587569] amdgpu 0000:72:00.0: [drm] DMUB hardware initialized: versi=
on=3D0x08006500
[  140.632422] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): DPRX read tim=
eout
[  140.688304] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): DPRX capabili=
ties read completed
[  140.688576] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): consumed band=
width 0/17280 Mb/s
[  140.688584] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): reclaiming u=
nused bandwidth
[  140.688796] thunderbolt 0000:71:00.0: 0:1: link maximum bandwidth 36000=
/36000 Mb/s
[  140.689065] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): consumed band=
width 0/17280 Mb/s
[  140.689109] thunderbolt 0000:71:00.0: 1:1: link maximum bandwidth 36000=
/36000 Mb/s
[  140.689354] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): consumed band=
width 0/17280 Mb/s
[  140.689356] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): available ba=
ndwidth 36000/18720 Mb/s
[  140.689932] thunderbolt 0000:71:00.0: 0:8: scaled bandwidth 2198/2198, =
scale 0
[  140.690299] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): increased ba=
ndwidth allocation to 9000/9000 Mb/s
[  140.690302] thunderbolt 0000:71:00.0: bandwidth consumption changed, re=
-calculating estimated bandwidth
[  140.690303] thunderbolt 0000:71:00.0: re-calculating bandwidth estimati=
on for group 1
[  140.690368] thunderbolt 0000:71:00.0: bandwidth estimation for group 1 =
done
[  140.690369] thunderbolt 0000:71:00.0: bandwidth re-calculation done
[  140.871917] amdgpu 0000:72:00.0: ring gfx_0.0.0 uses VM inv eng 0 on hu=
b 0
[  140.871921] amdgpu 0000:72:00.0: ring gfx_0.1.0 uses VM inv eng 1 on hu=
b 0
[  140.871923] amdgpu 0000:72:00.0: ring comp_1.0.0 uses VM inv eng 4 on h=
ub 0
[  140.871925] amdgpu 0000:72:00.0: ring comp_1.1.0 uses VM inv eng 6 on h=
ub 0
[  140.871927] amdgpu 0000:72:00.0: ring comp_1.2.0 uses VM inv eng 7 on h=
ub 0
[  140.871928] amdgpu 0000:72:00.0: ring comp_1.3.0 uses VM inv eng 8 on h=
ub 0
[  140.871930] amdgpu 0000:72:00.0: ring comp_1.0.1 uses VM inv eng 9 on h=
ub 0
[  140.871931] amdgpu 0000:72:00.0: ring comp_1.1.1 uses VM inv eng 10 on =
hub 0
[  140.871933] amdgpu 0000:72:00.0: ring comp_1.2.1 uses VM inv eng 11 on =
hub 0
[  140.871934] amdgpu 0000:72:00.0: ring comp_1.3.1 uses VM inv eng 12 on =
hub 0
[  140.871936] amdgpu 0000:72:00.0: ring sdma0 uses VM inv eng 13 on hub 0
[  140.871938] amdgpu 0000:72:00.0: ring vcn_unified_0 uses VM inv eng 0 o=
n hub 8
[  140.871940] amdgpu 0000:72:00.0: ring jpeg_dec uses VM inv eng 1 on hub=
 8
[  140.871941] amdgpu 0000:72:00.0: ring mes_kiq_3.1.0 uses VM inv eng 14 =
on hub 0
[  140.883827] PM: resume devices took 0.990 seconds
[  140.884393] OOM killer enabled.
[  140.884395] Restarting tasks: Starting
[  140.884866] xhci_hcd 0000:70:00.0: bad transfer trb length 4 in event t=
rb
[  140.885036] xhci_hcd 0000:70:00.0: bad transfer trb length 4 in event t=
rb
[  140.886241] Restarting tasks: Done
[  140.886259] efivarfs: resyncing variable state
[  140.889786] efivarfs: finished resyncing variable state
[  140.909812] PM: suspend exit
[  141.037834] r8169 0000:05:00.0 enp5s0: PHY [r8169-0-500:00] driver [Rea=
ltek Internal NBASE-T PHY] (irq=3DMAC)
[  147.723602] r8169 0000:05:00.0 enp5s0: configuring for phy/internal lin=
k mode
[  151.556700] r8169 0000:05:00.0 enp5s0: Link is Up - 1Gbps/Full - flow c=
ontrol off
[  196.336508] elogind-daemon[2633]: New session 3 of user achim.
[  286.215976] input: M720 Triathlon Keyboard as /devices/virtual/misc/uhi=
d/0005:046D:B015.0009/input/input20
[  286.216119] input: M720 Triathlon Mouse as /devices/virtual/misc/uhid/0=
005:046D:B015.0009/input/input21
[  286.216372] hid-generic 0005:046D:B015.0009: input,hidraw6: BLUETOOTH H=
ID v0.13 Keyboard [M720 Triathlon] on 44:fa:66:66:18:84
[  286.338054] elogind-daemon[2633]: Watching system buttons on /dev/input=
/event14 (M720 Triathlon Keyboard)

--nextPartRDrKY8kiS9mwV1l9GXnQ0A--



