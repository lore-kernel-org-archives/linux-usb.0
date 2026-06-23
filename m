Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F151A6835;
	Tue, 23 Jun 2026 03:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782183660; cv=none; b=WiZi/wSf0IyIpvo8a64N22zYd6CfD48FrD/f2GunRAqJStDfLMWGvA4RYNnMMOUgkMepqCejR/9VSa9vsK8i1ZXOLmmaiicp1+jSuq1RvOV6SqaR3apJe87kg9KV66HDj+twjezJfqXwmL3VHQbqUDX2Or18B2iGJq+5sVjK0UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782183660; c=relaxed/simple;
	bh=GAq+j45aHIFeioae/hLQ2v13/Euyv8k9KTO/iG68Qsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QqJLsHIY1Tc7faVJzdj64SGT3O1hXlRg/I1Q3LZMRYH6PpF8T6Zuh/xA+5i8zETgZj2C0Fco956O1VNn5Gt6U71+8lvFa3dUzN7sXk6Uw/XxZl9gVW1KkSlwXSa/41AZIey6yg2HTLtH5lR6aFT2EvDgGP/kjkm+ihyw7r4f1pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=kp33bITN; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="kp33bITN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1782183621;
	bh=nBjcqeiyZHOFnU8sFZBv1S5q0nIL7NcUlihGjHAtPus=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=kp33bITNF2aCRyLU7S+Je1KscVlNjTq7fVrN0HBfIuhSMZ1T+FBWvDXDDwna4wafm
	 r1rnTUvoAm2nbBhYnuRyzuo7nbXY+6xdz3LSWLmN6PJ3Xbp80i22CAR6RMexoo5xqP
	 ofHFNP3v/kWpHXxVM73Lnq8x46j+s33hrX+lqKfY=
X-QQ-mid: esmtpgz15t1782183616ta8c0fa34
X-QQ-Originating-IP: aqBG5aaKWCxQ3IgqG5b2BXC3oZAsvTt4uLyET73d3AI=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 23 Jun 2026 11:00:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 3637450055281435264
EX-QQ-RecipientCnt: 7
From: raoxu <raoxu@uniontech.com>
To: skhan@linuxfoundation.org
Cc: i@zenithal.me,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	raoxu@uniontech.com,
	shuah@kernel.org,
	valentina.manea.m@gmail.com
Subject: Re: [PATCH] usbip: tools: support SuperSpeed Plus devices
Date: Tue, 23 Jun 2026 11:00:14 +0800
Message-ID: <128F28BF64FB9807+20260623030014.1572292-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <d2c461a4-9271-43b5-9ba4-8c3c9c63c134@linuxfoundation.org>
References: <d2c461a4-9271-43b5-9ba4-8c3c9c63c134@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: N6+UlSQllctNGpFUeOCgBTMI5j0aynpeRo9HAzzVHfAvV9YbTF7LAGIV
	9Ky5qjNfyIdvM/M4Do2bjfqkK+TfiXBxPqS29BwE++/c1Wfg+XWWLR3xQGBSIkBWVCkYukS
	SeNKGcn88gxgsvnrSvCCUJfGfNaiAvIp97Ow8xwcDMAzalwO6eHSkDswUPJSyn+khT1yNI8
	VcD/iXNiD8XGM4mhnKM6FIM49Xp4QqVhxVVd9PwacEFPHqGlVsUdYJ5ryv7Xf8fiozT1cc6
	SB7vrCYh051CvtwpV4rk2ek5ZboRTy70vE2i3mlUU1s/h9RpCaxMX/gh59XIXJYr83KHQo+
	jX608BXH+6lXke6/ddb2NulktyhBS5Ka2Nk3tP/RS+qY587f5LDjrCEQ9JMkx7JO3nrG02o
	Q87RKREteOfFY91Vj/Bz/TipIeghl6loUC3sHTvODeEvRTojpWBVEc84GTUxwU+hy/NYwiR
	Mglxyja3rfm3MtKpUiBXzRUtDq6UOKxCnLlTM8bWi3LLjtiIGoNCV7s/N2T7T96h2QIMGld
	XH0hETVsuSAPBSps53QFB9/gUJ9gY4MTGRVODn+e2ehgz0K1frGSkxxEqVPyZYzjSkVuaAt
	P5wYkLiIO1Va2JJB9E9nWt7Vr2iULEyQtac8vC4DSp1fySwOr726MKem+bi04+Ik+UHhmeK
	60nADzpDIQRKhn9xsBlgAQB/9vnUoB4ZKzl6xaDqla9WcaMxrprgxOBdVB2199wiCF/Z8xn
	Vh8dqszbY3jPLu5ZEbDZqDvdfSCBUL945bkhbmoAs5zo2HjY4upySR+EX6jB+6YwLvOoDQS
	vDUvQ/zw4CSFK0jwiH993g5G1kINH9cWdWl+5S02izAuREP0Q2KfDpJAz1UuyF98+2oPAk/
	i61S7BL6W0jVRN3GhKW02g4U5B7D7qxD8sTJttle6hzr2dY5CtYw9VOjF9sXgxE/GSfv5WO
	zpypSaNw+EB7ahBQMmwxofsgOlUMlsta5XbjVkkl0MLKbHEwwyCrR87JaRVeDlaXtz8BuCL
	mlNZ3T8ckwmL1brMkIZUVmIt1ls9Dvt7/E4aJcJvDCzp8Lyjmg
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

Hi Shuah,

Thanks for reviewing.

On Mon, Jun 22, 2026 at 01:20:16PM -0600, Shuah Khan wrote:
> > +	{ USB_SPEED_SUPER_PLUS, "10000", "SuperSpeed Plus" },
> > +	{ USB_SPEED_SUPER_PLUS, "20000", "SuperSpeed Plus" },
>
> These are duplicate strings? Shouldn't they
> be unique?

The sysfs strings are unique: "10000" and "20000".  They map to the
same USB_SPEED_SUPER_PLUS enum because enum usb_device_speed does not
distinguish the SuperSpeed Plus link rates.

> > +		case	USB_SPEED_SUPER_PLUS:
> >  			if (vhci_driver->idev[i].hub != HUB_SPEED_SUPER)
>
> Won't this continue when hub == USB_SPEED_SUPER_PLUS?
> Doesn't look right to me.

idev[i].hub is enum hub_speed, not enum usb_device_speed. enum
hub_speed identifies the two VHCI root-hub groups:

  HUB_SPEED_HIGH
  HUB_SPEED_SUPER

There is no HUB_SPEED_SUPER_PLUS value or separate SuperSpeed Plus
root-hub group. Both USB_SPEED_SUPER and USB_SPEED_SUPER_PLUS devices
use the existing USB 3.x VHCI root hub, represented by
HUB_SPEED_SUPER.

Therefore, when speed is USB_SPEED_SUPER_PLUS, a port with
idev[i].hub == HUB_SPEED_SUPER is the expected match and the code does
not continue.

Thanks,
Xu Rao
