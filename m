Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A364329B78F
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 07:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769499807; cv=none; b=GRPzv07V4bJxOiPbcXuL8gzOSCrThTsv9HZunyoMug5djLpfXmf+sm8Yf9DtA7NfkIDOcDsXYzXyiKZO5pA0nljLixkHc4FaEcijverqB5Euy+9iS1x/395lLF2hDTlslboppwsYDxo93Fe8s0KQO4GVtQhSGuZUSGk/nKcZruE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769499807; c=relaxed/simple;
	bh=jRFlianfvhERyS4SQ8HXJV4xHZ0IAZbBHxBU2K0iu/Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QLPc1eLZD31OA+IoSXi1ldHjAay637xa0MgK7EA581QjxSZfYrKrcQFLlWvE7QMbasVhVFCwSv+8SAbqdcsJuTTi5kRyOCwTMw4cP3N72wzJcI09GsNqI//CHTVK+C9VQGaLPrfSG11hujbVDgBfWaYButWR0Z71/Ms5egCgDj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=pBhjh4uu; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="pBhjh4uu"
DKIM-Signature: a=rsa-sha256; b=pBhjh4uu/IaXMFyJOFZ4J7tDIPlA58kgYhG6qtaXr6zyMeUf9NRrWfrMIsb4TPiTXtfZesYG0Yj2eqiE/VseBEQ/7LmlMpy+oYjslJAMCGeuB8fMfK/LF24WnN+krVUGdeJZ5o0HbBBoGLugWDhlk2EzGa2IdXw0K717SQfXAJFYnmxLeSA7AQpAg7Bxc3P44x1e4uzr+opYW0U5f9h5sWxqSMFvMGPRccIWfToejNOi75DXpNxLLV2FNZZzI5kRTxr5bUJSJTEBUIjs1K5uIXURPNL+grfp0qog+uxuiXNZB62zYVQd6BIozML5evkGuhILP9SS9SpwQydY1GgHgQ==; s=purelymail1; d=purelymail.com; v=1; bh=jRFlianfvhERyS4SQ8HXJV4xHZ0IAZbBHxBU2K0iu/Y=; h=Feedback-ID:Received:Received:From:To:Subject:Date;
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: linux-usb@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1981953599;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 27 Jan 2026 07:43:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
	(envelope-from <peter@korsgaard.com>)
	id 1vkdjH-00000000FYe-0Vcz;
	Tue, 27 Jan 2026 08:43:15 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: netdev@vger.kernel.org,  linux-usb@vger.kernel.org,  Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>,  Andrew Lunn <andrew+netdev@lunn.ch>,
  "David S. Miller" <davem@davemloft.net>,  Eric Dumazet
 <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni
 <pabeni@redhat.com>,  Petko Manolov <petkan@nucleusys.com>,  Steve
 Glendinning <steve.glendinning@shawell.net>,
  UNGLinuxDriver@microchip.com,  Nikita Zhandarovich
 <n.zhandarovich@fintech.ru>,  Oliver Neukum <oneukum@suse.com>,  Krzysztof
 =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,  Deepanshu Kartikey
 <kartikey406@gmail.com>,
  Oleksij Rempel <o.rempel@pengutronix.de>,  Max Schulze
 <max.schulze@online.de>,  Thomas Gleixner <tglx@kernel.org>,  Ingo Molnar
 <mingo@kernel.org>,  "Gustavo A. R. Silva" <gustavoars@kernel.org>,  Kees
 Cook <kees@kernel.org>,  Eric Biggers <ebiggers@google.com>
Subject: Re: [PATCH net-next v3] net: usb: remove unnecessary get_drvinfo
 code and driver versions
In-Reply-To: <20260127060534.51206-1-enelsonmoore@gmail.com> (Ethan
	Nelson-Moore's message of "Mon, 26 Jan 2026 22:04:38 -0800")
References: <20260127060534.51206-1-enelsonmoore@gmail.com>
Date: Tue, 27 Jan 2026 08:43:14 +0100
Message-ID: <87ecnb1ox9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

>>>>> "Ethan" == Ethan Nelson-Moore <enelsonmoore@gmail.com> writes:

 > Many USB network drivers define get_drvinfo functions which add no
 > value over usbnet_get_drvinfo, only setting the driver name and
 > version. usbnet_get_drvinfo automatically sets the driver name, and
 > separate driver versions are now frowned upon in the kernel. Remove all
 > driver versions and replace these get_drvinfo functions with references
 > to usbnet_get_drvinfo where possible. Where that is not possible,
 > remove unnecessary code to set the driver name. Also remove two
 > unnecessary initializations from aqc111_get_drvinfo, an inaccurate
 > comment in pegasus.c, and an unused macro in catc.c.

 > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 > Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
 > ---
 > Changes in v3:
 > Add changelog
 > Add received Reviewed-by tag

 > Changes in v2:
 > Also remove driver versions from smsc[79]5xx (missed in the original
 > patch because they had a version definition but didn't use it in
 > get_drvinfo)

Reviewed-by: Peter Korsgaard <peter@korsgaard.com> (for dm9601.c)

-- 
Bye, Peter Korsgaard
