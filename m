Received: from server2.peakatel.com (server2.peakatel.com [102.130.118.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4B1181334
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 10:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=102.130.118.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787912666; cv=none; b=bHl27n4f0fVkG/37uXOoepRawRbUb+nH/6payZDodWLZse9cuTUCMyrbGnGJAYMvgs5Ke0OF4QxUVWnfzj4oc8DAWi1b6nPHwxcxPn7FNYKBPdGdwdO5ndPZCKP8Aa/ZpmyWfU0zn47f8k166yFMgyRizETMt2afyq/AayXIceo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787912666; c=relaxed/simple;
	bh=JaouZ2JFyD6mM5cLBRbJpXpzUQ6r1jPNxEQkP+RtYJ4=;
	h=Message-ID:From:To:Subject:Date:MIME-Version:Content-Type; b=Rrj4LYNJV5zTF2RYAmgV9XewKFfFaIy2rW8svYcvNkXNqE9DBzNvXHSZoTzwhhglh0E/H4wtSAncaIzCJPfoIqIS8dsrNq5ZLXxbsGyl/iuCliC7H1YrawbewDfer6UWU9xvK7F9rQWAN3OmYlBVQ+gXCO08cwnPNTkq7riq7V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=snyc.org.sz; spf=pass smtp.mailfrom=snyc.org.sz; dkim=pass (2048-bit key) header.d=snyc.org.sz header.i=@snyc.org.sz header.b=SKA0SDV3; arc=none smtp.client-ip=102.130.118.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=snyc.org.sz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=snyc.org.sz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=snyc.org.sz header.i=@snyc.org.sz header.b="SKA0SDV3"
Received: from houmdiz (unknown [185.184.171.186])
	by server2.peakatel.com (Postfix) with ESMTPSA id 9E153A743C
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 12:14:38 +0200 (SAST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=snyc.org.sz; s=202304;
	t=1787912079; bh=JaouZ2JFyD6mM5cLBRbJpXpzUQ6r1jPNxEQkP+RtYJ4=;
	h=Reply-To:From:To:Subject:Date:From;
	b=SKA0SDV3KxRSZczJ12bK1R4TB4q9GmKLaKuIE5FIGpQHvFQtuCjUIQg5jxd0EAye3
	 gsDl+2pAATC991vLFBCZTQ69fu+Wtmc3YAjadS8hPeZNLP/eyvC5d9j1G3mBcwtyQw
	 DC2vNVrkVrCkbckOIU200RLJZGzcKQtBVGBW1/LND+Nd2x8omJTbD8o+VndRhqFWjF
	 tfRE74FptAlKxdw04AUpISmBg78y5jYbx02Cd91g+yw+LErZyJS4v1H/A9rAUCRARL
	 RzdvTp+/PvWVdxM/+q/sX9WZReQXPTfaLpRXEKQ3BBoorcovq0XbTbIUfz8bJY99C3
	 PNnw0BaTfxHlg==
Message-ID: <a653cd8175b1f8b3903ee74cb87953596d008859@snyc.org.sz>
Reply-To: =?utf-8?B?0J/QvtC90L7QvNCw0YDQtdC90LrQviDQktGW0YLQsNC70ZbQuSDQntC70LU=?=
	=?utf-8?B?0LrRgdCw0L3QtNGA0L7QstC40Yc=?= <kahc@vimk.com.ua>
From: =?utf-8?B?0J/QvtC90L7QvNCw0YDQtdC90LrQviDQktGW0YLQsNC70ZbQuSDQntC70LU=?=
	=?utf-8?B?0LrRgdCw0L3QtNGA0L7QstC40Yc=?= <ceo@snyc.org.sz>
To: linux-usb@vger.kernel.org
Subject: =?utf-8?B?0JHRg9C00Ywg0LvQsNGB0LrQsCwg0L/QtdGA0LXQtNC30LLQvtC90ZbRgg==?=
	=?utf-8?B?0Ywg0L3QsNC8INGC0LXRgNC80ZbQvdC+0LLQviDigJQg0LTQt9Cy0ZbQvQ==?=
	=?utf-8?B?0LrQuCDQtNC+INCS0LDRgSDQt9Cw0LvQuNGI0LDRjtGC0YzRgdGPINCx0LU=?=
	=?utf-8?B?0Lcg0LLRltC00L/QvtCy0ZbQtNGWLiAg?=
Date: Fri, 28 Aug 2026 13:14:36 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=94=D0=BE=D0=B1=D1=80=D0=B8=D0=B9 =D0=B4=D0=B5=D0=BD=D1=8C,  =D0=BC=D0=
=B8 =D0=BD=D0=B5 =D0=BC=D0=BE=D0=B6=D0=B5=D0=BC=D0=BE =D0=B4=D0=BE=D0=B4=D0=
=B7=D0=B2=D0=BE=D0=BD=D0=B8=D1=82=D0=B8=D1=81=D1=8F =D0=B4=D0=BE =D0=92=D0=
=B0=D1=81, =D1=82=D0=BE=D0=BC=D1=83 =D0=BF=D1=80=D0=BE=D1=88=D1=83 =D0=9D=
=D0=95=D0=92=D0=86=D0=94=D0=9A=D0=9B=D0=90=D0=94=D0=9D=D0=9E =D0=BF=D0=B5=
=D1=80=D0=B5=D0=B4=D0=B7=D0=B2=D0=BE=D0=BD=D0=B8=D1=82=D0=B8 =D0=BC=D0=B5=
=D0=BD=D1=96 =D0=B7=D0=B0 =D0=BD=D0=BE=D0=BC=D0=B5=D1=80=D0=BE=D0=BC (073=
) 641-73-44.

=D0=97 =D0=BF=D0=BE=D0=B2=D0=B0=D0=B3=D0=BE=D1=8E,
=D0=9F=D0=BE=D0=BD=D0=BE=D0=BC=D0=B0=D1=80=D0=B5=D0=BD=D0=BA=D0=BE =D0=92=
=D1=96=D1=82=D0=B0=D0=BB=D1=96=D0=B9 =D0=9E=D0=BB=D0=B5=D0=BA=D1=81=D0=B0=
=D0=BD=D0=B4=D1=80=D0=BE=D0=B2=D0=B8=D1=87
(067) 995-08-92
(073) 641-73-44



