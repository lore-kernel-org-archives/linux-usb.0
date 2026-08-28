Received: from c4.my-control-panel.com (c4.my-control-panel.com [198.251.88.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E510353E0B
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 11:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.251.88.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787916066; cv=none; b=HMUd2MOrl8ZCnsxtOv5qBS1RSCoFAbUiS/eUPXZ27UEzJ2NTxa4q27tIL7WnG491G7lwSF9JIZjcd7h8ogExSe8bsfSDFBFx1HrnzTfP0rlTqI6ryf1dsWtHhpww2vr8lOLcRQAJNboNrdpN01m1UUJK7fQ8+afmTUqiqzDBZ2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787916066; c=relaxed/simple;
	bh=F3vB7uSql9BNTo3AtSbi2tySWAvWQmuBSE3Z1QLzh+s=;
	h=Message-ID:From:To:Subject:Date:MIME-Version:Content-Type; b=BNkM1MnH9HQFEY4eZnssbRTv8nCVUCihMVgtq8ig9scH2jhDpZ5SH2wMgw2H69zaUds5EylI8wUm6DEUE9GRwC6AIMF36lGsT2wgOpqAvnaIqVNtDJYnY/G8fOonWjYESSYXaw3kY3QP0dHG8NI/BP2QRsCU0pmPlJhO619exCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nanovolteg.com; spf=pass smtp.mailfrom=nanovolteg.com; dkim=pass (2048-bit key) header.d=nanovolteg.com header.i=@nanovolteg.com header.b=D+SRw0r7; arc=none smtp.client-ip=198.251.88.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nanovolteg.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nanovolteg.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nanovolteg.com header.i=@nanovolteg.com header.b="D+SRw0r7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=nanovolteg.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Date:Subject:To:From:Reply-To:Message-ID:Sender:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fUKMwA21eWZnXguRmPRoL27k/1UItqNcv8mJM7M9vz4=; b=D+SRw0r7OhBa5qacg58Jm+iEip
	ykd836tv3L5Mg3CeCxYH4/Dqv49LY9BkipR/GQPjyfVh8PMog9d21W7NOmTLjRoUNmIAZbRcaD36R
	eeOsx2UhxMjvmaKEf/cataQPxfW+0SoP/Z89lygNVj2tP3ee5ih/J34LjW+dvoDqAgsV2dUA8/bNx
	s/4Jj3q4hriowB29kAXDHSPWQf58elc35AcerZDJVqwyHxM/KnJst0/YX9nQEVP8hKZdWr81elwFf
	1Jcu34r+u5NrD9V3DkbSrmex4OhnqckJrRS4X8cXuEcihlBOtvfXxsOIjyEk1Qr2DqAYo+LEDSTnG
	zoGVhOUQ==;
Received: from [185.184.171.186] (port=64790 helo=parfcvp)
	by c4.my-control-panel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <ahmed.magdy@nanovolteg.com>)
	id 1wzuOe-0000000By01-05SG
	for linux-usb@vger.kernel.org;
	Fri, 28 Aug 2026 14:05:18 +0300
Message-ID: <24701ad226e2abe0c36db41feb2a606a5edc4f15@nanovolteg.com>
Reply-To: =?utf-8?B?0J/RltC90YHQutC10YAg0KDRltC0INCg0LDRgtC40LHQvtGA0L7QstC40Yc=?= <ssu@gov.ua>
From: =?utf-8?B?0J/RltC90YHQutC10YAg0KDRltC0INCg0LDRgtC40LHQvtGA0L7QstC40Yc=?= <ahmed.magdy@nanovolteg.com>
To: linux-usb@vger.kernel.org
Subject: =?utf-8?B?0IbQvdGE0L7RgNC80LDRhtGW0Y8gKNCy0LjQvNCw0LPQsNGUINGA0LXQsNCz?=
	=?utf-8?B?0YPQstCw0L3QvdGPKSAt0JTQvtGA0L7RiNC10L3QutC+INCR0YPQtNC40Lw=?=
	=?utf-8?B?0LjRgCDQlNC+0LHRgNC+0LzQuNGA0L7QstC40Yc=?=
Date: Fri, 28 Aug 2026 14:05:16 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - c4.my-control-panel.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - nanovolteg.com
X-Get-Message-Sender-Via: c4.my-control-panel.com: authenticated_id: ahmed.magdy@nanovolteg.com
X-Authenticated-Sender: c4.my-control-panel.com: ahmed.magdy@nanovolteg.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

=D0=AF =D0=9A=D0=B0=D1=87=D1=83=D1=80 =D0=93=D0=B5=D1=80=D0=B0=D1=81=D0=B8=
=D0=BC =D0=97=D0=BE=D1=80=D1=8F=D0=BD=D0=BE=D0=B2=D0=B8=D1=87,=D0=9F=D0=BE=
=D0=BF=D0=B5=D1=80=D0=B5=D0=B4=D0=B6=D0=B0=D1=8E =D0=92=D0=B0=D1=81, =D1=89=
=D0=BE =D1=8F =D0=B7=D0=B0=D0=BC=D1=96=D0=BD=D1=83=D0=B2=D0=B0=D0=B2 =D0=BE=
=D1=84=D1=96=D1=81=D0=BD=D1=83 =D0=B1=D1=83=D0=B4=D1=96=D0=B2=D0=BB=D1=8E=
 =D0=B7=D0=B0 =D0=B0=D0=B4=D1=80=D0=B5=D1=81=D0=BE=D1=8E =D0=BC. =D0=9C=D0=
=B8=D0=BA=D0=BE=D0=BB=D0=B0=D1=97=D0=B2, =D0=B2=D1=83=D0=BB. =D0=9C=D0=B0=
=D0=BB=D0=B0 =D0=9C=D0=BE=D1=80=D1=81=D1=8C=D0=BA=D0=B0, =D0=B1=D1=83=D0=B4=
. 108/5 =D0=BD=D0=B0 3=E2=80=935 =D0=BF=D0=BE=D0=B2=D0=B5=D1=80=D1=85=D0=B0=
=D1=85 =D1=83 =D1=81=D1=82=D0=B5=D0=BB=D1=8C=D0=BE=D0=B2=D1=96=D0=B9 =D1=87=
=D0=B0=D1=81=D1=82=D0=B8=D0=BD=D1=96 =D1=8F =D0=B2=D1=81=D1=82=D0=B0=D0=BD=
=D0=BE=D0=B2=D0=B8=D0=B2 =D1=83 =D0=B2=D0=B0=D0=BA=D1=83=D1=83=D0=BC=D0=BD=
=D0=B8=D1=85 =D0=BF=D0=B0=D0=BA=D0=B5=D1=82=D0=B0=D1=85 7 =D0=B2=D0=B8=D0=
=B1=D1=83=D1=85=D0=BE=D0=B2=D0=B8=D1=85 =D0=BF=D1=80=D0=B8=D1=81=D1=82=D1=
=80=D0=BE=D1=97=D0=B2,
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


