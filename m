Received: from forward501b.mail.yandex.net (forward501b.mail.yandex.net [178.154.239.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12CC4078F3
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 10:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787568546; cv=none; b=bXlNR/HXgRLvRduwb4cShHRymiTCxd6aMdneN2NFyIQ3T8d95efUIh4WEREVkh0ca+RcaDTHwZiOf7n6QpgZWY9RIW4p/zB2gNvXUSEg+T8cCyj4DbxA1oki9XtpBGzQbyPGIpTK4xUqblZBTkOZxCItoKNHz9lzKZJ4qVSv72I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787568546; c=relaxed/simple;
	bh=p9+MFcD6IwwCHYZu0Q2JyXcgOsa/V0nwZznAjbgYrVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kixb33kQc+xmgYEiINp+BMi84DQfAv9fQ8Zkch35cGinCrEezZW9KCYQJRbVi4Dtm+srcBMQKB3g4skYwUJDCKui+Ri2imD/GPLIkCCOQv+B5Wwfu/ujxmDrNLP3s+/ZVUlxeeG9mvEU2pRkiTjpiNCnLJO1XTcLokzQ2aBvdxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=JgYNnBgN; arc=none smtp.client-ip=178.154.239.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="JgYNnBgN"
Received: from mail-nwsmtp-smtp-production-main-98.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-98.sas.yp-c.yandex.net [IPv6:2a02:6b8:c1c:3033:0:640:ec58:0])
	by forward501b.mail.yandex.net (postfix) with ESMTPS id 9FF548285F;
	Mon, 24 Aug 2026 13:42:38 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-98.sas.yp-c.yandex.net (smtp) with ESMTPSA id agYrZ8pfHSw0-ecRQt7XA;
	Mon, 24 Aug 2026 13:42:38 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1787568158; bh=p9+MFcD6IwwCHYZu0Q2JyXcgOsa/V0nwZznAjbgYrVI=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=JgYNnBgN7W3gldWlIGpeQkye0Jx4D/8RT/bjCqR5zYoPGANtgWDOK166knIIy+te9
	 dLIFIbGLJ9aJ3ioMSMfTjEzI2BN99HnzlcReDpxoZxmATKAy5sxNzhBZ2IqTisaE9K
	 pn4h450/NeWp4HX21v8aKFRAxRhDJjD5JsJ4nB+4=
Authentication-Results: mail-nwsmtp-smtp-production-main-98.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Mikhail Zubenko <misha.zubenko.01@yandex.ru>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v3] usb: gadget: dummy_hcd: add tick_us module parameter
 for timer-rate tuning
Date: Mon, 24 Aug 2026 10:42:36 -0000
Message-ID: <178756815622.161372.4138526785481959140@yandex.ru>
In-Reply-To: <178750530003.146199.10916428504166445366@yandex.ru>
References: <178750530003.146199.10916428504166445366@yandex.ru>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Greg,

yes - my v3 had the changelog above the --- marker. v4 moves it
below, where it gets stripped automatically. Code unchanged.

thanks,
Mikhail
