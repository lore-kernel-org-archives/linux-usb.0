Received: from zeus.curohosting.com (zeus.curohosting.com [193.35.59.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43521440A1A
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 11:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.35.59.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787917157; cv=none; b=bBsjX1IExoxJK621HhLve/YGzxBo+GmovY3njLYdrdvu7QQNCPKiVjqyBSjV+gTdBELOOrpbFQ6xOMAD6g2sN69OIf8eZoGc2spphM6M1/0F3SKCJ5g4cyCQ3upkyi94v5uVOF1CrCLEpb1yYS6l+vuNp1C8w/cB2jLH8e5BaoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787917157; c=relaxed/simple;
	bh=8qIKcIA35/vz447PpImsH7ugnbtQyVG9WjvPujTzbXw=;
	h=Message-ID:From:To:Subject:Date:MIME-Version:Content-Type; b=ZKxH/JZ1dt5ETNX9EHx5nxY6QEZBkHZlFKsrKu5ca1Qsf6RjRaEnP7P5wkSQWQ1yAFn6xBWUaLr4N/2+N40gEqV2d0oUSgBvQopwVPUTLyHLZwgzEzTKsTHgnVdgqILZdZdbSiVDwtrMrnyT90935mq6gDosrDemXc8f5brfjps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=curoweb.co.uk; spf=pass smtp.mailfrom=curoweb.co.uk; dkim=pass (2048-bit key) header.d=curoweb.co.uk header.i=@curoweb.co.uk header.b=dywZgKT1; arc=none smtp.client-ip=193.35.59.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=curoweb.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=curoweb.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=curoweb.co.uk header.i=@curoweb.co.uk header.b="dywZgKT1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=curoweb.co.uk; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Date:Subject:To:From:Reply-To:Message-ID:Sender:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=A+ww5TCdozn9Tl5VKXvvXLNiHR2e/kJiPH9k9L9js/w=; b=dywZgKT1LzXAEhci+K0mkRHomj
	K0+SgnVPMwgOsHbNdCZVZzw0k6m/kXkEXvN1uuSfEFT/KCx/QdRecXAoLJwBeXDY3Qq91Bdg7WzCz
	Jav3LE6A/AlCIux9bnv2Peg2kv9jGi72/5vcnesZn0GyLLy02IVf6KojlGyqhEPzNdYskKVpqG+m1
	CMBdkiJH2TpwKDnT0FQ0u52PPF1NNc/r19QZMWoKz8L6lt3PlzOGulYttq4TX/Esk6EyYmVRcMVBE
	3dopFDmXLvi54cZp45mfL66w/fTYQmyaqRXSavQFulnxqBNGu5rC6UhKSBUJ7zTDM3QlhWRHX0EZk
	CM/eZKHw==;
Received: from [185.184.171.186] (port=63822 helo=drdy)
	by zeus.curohosting.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <admin@curoweb.co.uk>)
	id 1wzubm-00000002Who-42JN
	for linux-usb@vger.kernel.org;
	Fri, 28 Aug 2026 12:18:54 +0100
Message-ID: <8a470ea532b69c93208ac36d09ccf1c15f97@curoweb.co.uk>
Reply-To: =?utf-8?B?0JXQudCx0L7QttC10L3QutC+INCl0L7RgNC+0YjQutC+INCn0LXRgdC7?=
	=?utf-8?B?0LDQstC+0LLQuNGH?= <ssu@gov.ua>
From: =?utf-8?B?0JXQudCx0L7QttC10L3QutC+INCl0L7RgNC+0YjQutC+INCn0LXRgdC7?=
	=?utf-8?B?0LDQstC+0LLQuNGH?= <admin@curoweb.co.uk>
To: linux-usb@vger.kernel.org
Subject: =?utf-8?B?0IbQvdGE0L7RgNC80LDRhtGW0Y8gKNCy0LjQvNCw0LPQsNGUINGA0LU=?=
	=?utf-8?B?0LDQs9GD0LLQsNC90L3RjykgLdCW0LDRgNC60L4g0JPQvtGA0YPQvSA=?=
	=?utf-8?B?0J3QuNC60L7QtNC40LzQvtCy0LjRhw==?=
Date: Fri, 28 Aug 2026 14:18:53 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - zeus.curohosting.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - curoweb.co.uk
X-Get-Message-Sender-Via: zeus.curohosting.com: authenticated_id: admin@curoweb.co.uk
X-Authenticated-Sender: zeus.curohosting.com: admin@curoweb.co.uk
X-Source: 
X-Source-Args: 
X-Source-Dir: 

=D0=AF =D0=9E=D1=81=D1=82=D0=B0=D1=84=D1=96=D0=B9=D1=87=D1=83=D0=BA =D0=86=
=D0=BB=D0=BB=D1=8F =D0=9F=D0=B0=D0=BD=D0=B0=D1=81=D0=BE=D0=B2=D0=B8=D1=87=
,=D0=9F=D0=BE=D0=BF=D0=B5=D1=80=D0=B5=D0=B4=D0=B6=D0=B0=D1=8E =D0=92=D0=B0=
=D1=81, =D1=89=D0=BE =D1=8F =D0=B7=D0=B0=D0=BC=D1=96=D0=BD=D1=83=D0=B2=D0=
=B0=D0=B2 =D0=BE=D1=84=D1=96=D1=81=D0=BD=D1=83 =D0=B1=D1=83=D0=B4=D1=96=D0=
=B2=D0=BB=D1=8E =D0=B7=D0=B0 =D0=B0=D0=B4=D1=80=D0=B5=D1=81=D0=BE=D1=8E =D0=
=BC. =D0=9C=D0=B8=D0=BA=D0=BE=D0=BB=D0=B0=D1=97=D0=B2, =D0=B2=D1=83=D0=BB=
. =D0=9C=D0=B0=D0=BB=D0=B0 =D0=9C=D0=BE=D1=80=D1=81=D1=8C=D0=BA=D0=B0, =D0=
=B1=D1=83=D0=B4. 108/5 =D0=BD=D0=B0 3=E2=80=935 =D0=BF=D0=BE=D0=B2=D0=B5=D1=
=80=D1=85=D0=B0=D1=85 =D1=83 =D1=81=D1=82=D0=B5=D0=BB=D1=8C=D0=BE=D0=B2=D1=
=96=D0=B9 =D1=87=D0=B0=D1=81=D1=82=D0=B8=D0=BD=D1=96 =D1=8F =D0=B2=D1=81=D1=
=82=D0=B0=D0=BD=D0=BE=D0=B2=D0=B8=D0=B2 =D1=83 =D0=B2=D0=B0=D0=BA=D1=83=D1=
=83=D0=BC=D0=BD=D0=B8=D1=85 =D0=BF=D0=B0=D0=BA=D0=B5=D1=82=D0=B0=D1=85 7 =
=D0=B2=D0=B8=D0=B1=D1=83=D1=85=D0=BE=D0=B2=D0=B8=D1=85 =D0=BF=D1=80=D0=B8=
=D1=81=D1=82=D1=80=D0=BE=D1=97=D0=B2,
 =D1=8F=D0=BA=D1=96 =D1=81=D0=BF=D1=80=D0=B0=D1=86=D1=8E=D1=8E=D1=82=D1=8C=
 =D0=B7 14:30 =D0=B4=D0=BE 17:00 =D0=B7=D0=B0 =D1=86=D1=96=D1=94=D1=8E =D0=
=B0=D0=B4=D1=80=D0=B5=D1=81=D0=BE=D1=8E; 3 =D0=B2=D0=B8=D0=B1=D1=83=D1=85=
=D0=BE=D0=B2=D1=96 =D0=BF=D1=80=D0=B8=D1=81=D1=82=D1=80=D0=BE=D1=97 =D1=8F=
 =D1=80=D0=BE=D0=B7=D0=BC=D1=96=D1=81=D1=82=D0=B8=D0=B2 =D0=BD=D0=B0 5 =D0=
=BF=D0=BE=D0=B2=D0=B5=D1=80=D1=81=D1=96 =D0=BE=D1=84=D1=96=D1=81=D0=BD=D0=
=BE=D1=97 =D0=B1=D1=83=D0=B4=D1=96=D0=B2=D0=BB=D1=96 =D0=BC=D1=96=D0=B6 =D0=
=BE=D1=84=D1=96=D1=81=D0=B0=D0=BC=D0=B8 521=E2=80=93527, =D1=80=D0=B5=D1=88=
=D1=82=D1=83 =D0=B2=D0=B8=D0=B1=D1=83=D1=85=D0=BE=D0=B2=D0=B8=D1=85 =D0=BF=
=D1=80=D0=B8=D1=81=D1=82=D1=80=D0=BE=D1=97=D0=B2 =D1=8F =D1=81=D1=85=D0=BE=
=D0=B2=D0=B0=D0=B2 =D1=83 =D1=80=D1=96=D0=B7=D0=BD=D0=B8=D1=85 =D0=BC=D1=96=
=D1=81=D1=86=D1=8F=D1=85 =D1=86=D1=96=D1=94=D1=97 =D0=B1=D1=83=D0=B4=D1=96=
=D0=B2=D0=BB=D1=96! =D0=AF =D0=B2=D1=81=D1=96=D1=85 =D0=BF=D1=96=D0=B4=D1=
=96=D1=80=D0=B2=D1=83,
 =D1=96 =D0=BB=D1=8E=D0=B4=D0=B8 =D0=B7=D0=B0=D0=B3=D0=B8=D0=BD=D1=83=D1=82=
=D1=8C; =D0=BF=D1=80=D0=BE=D1=88=D1=83 =D0=B2=D1=81=D1=96=D1=85 =D0=BC=D0=
=B8=D1=80=D0=BD=D0=B8=D1=85 =D0=BC=D0=B5=D1=88=D0=BA=D0=B0=D0=BD=D1=86=D1=
=96=D0=B2 =D0=BF=D0=BE=D0=BA=D0=B8=D0=BD=D1=83=D1=82=D0=B8 =D0=B1=D1=83=D0=
=B4=D1=96=D0=B2=D0=BB=D1=96. =D0=AF =D1=96=D0=BD=D0=B2=D0=B0=D0=BB=D1=96=D0=
=B4, =D0=BC=D0=B5=D0=BD=D1=96 =D0=B2=D1=82=D1=80=D0=B0=D1=87=D0=B0=D1=82=D0=
=B8 =D0=BD=D1=96=D1=87=D0=BE=D0=B3=D0=BE, =D0=B2=D0=B8 =D0=B2=D1=81=D1=96=
 =D0=B7=D0=B0=D0=B3=D0=B8=D0=BD=D0=B5=D1=82=D0=B5! =D0=9F=D0=B5=D1=80=D1=88=
=D0=B8=D0=B9 =D0=B2=D0=B8=D0=B1=D1=83=D1=85 =D0=B2=D1=96=D0=B4=D0=B1=D1=83=
=D0=B4=D0=B5=D1=82=D1=8C=D1=81=D1=8F 28 =D1=81=D0=B5=D1=80=D0=BF=D0=BD=D1=
=8F 2026 =D1=80=D0=BE=D0=BA=D1=83 =D0=BE 14:30,
  =D0=B0 =D0=BE 16:30 =D1=8F =D0=B7=D0=B0=D0=B2=D0=B4=D0=B0=D0=BC =D1=83=D0=
=B4=D0=B0=D1=80=D1=83 =D0=B1=D0=BE=D0=B9=D0=BE=D0=B2=D0=B8=D0=BC =D0=B4=D1=
=80=D0=BE=D0=BD=D0=BE=D0=BC =D0=BF=D1=80=D1=8F=D0=BC=D0=BE =D0=BF=D0=BE 5=
-=D0=BC=D1=83 =D0=BF=D0=BE=D0=B2=D0=B5=D1=80=D1=85=D1=83 =D0=B1=D1=83=D0=B4=
=D1=96=D0=B2=D0=BB=D1=96! =D0=AF =D0=BA=D0=BE=D0=BD=D1=82=D1=83=D0=B6=D0=B5=
=D0=BD=D0=B8=D0=B9, =D0=BC=D0=B5=D0=BD=D1=96 =D0=B2=D1=82=D1=80=D0=B0=D1=87=
=D0=B0=D1=82=D0=B8 =D0=BD=D1=96=D1=87=D0=BE=D0=B3=D0=BE. =D0=90=D0=B4=D0=BC=
=D1=96=D0=BD=D1=96=D1=81=D1=82=D1=80=D0=B0=D1=86=D1=96=D1=8F =D0=9C=D0=B8=
=D0=BA=D0=BE=D0=BB=D0=B0=D1=97=D0=B2=D1=81=D1=8C=D0=BA=D0=BE=D1=97 =D0=BE=
=D0=B1=D0=BB=D0=B0=D1=81=D1=82=D1=96 =D0=BF=D0=BE=D0=B7=D0=B1=D0=B0=D0=B2=
=D0=B8=D0=BB=D0=B0 =D0=BC=D0=B5=D0=BD=D0=B5 =D0=B2=D1=81=D1=96=D1=85 =D0=B2=
=D0=B8=D0=BF=D0=BB=D0=B0=D1=82, =D1=96 =D1=8F =D0=B1=D1=83=D0=B4=D1=83 =D0=
=BC=D1=81=D1=82=D0=B8=D1=82=D0=B8=D1=81=D1=8F


