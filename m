Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E53F23536B
	for <linux-usb@vger.kernel.org>; Mon, 23 Feb 2026 08:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771836353; cv=none; b=VEQvahRehSvCbD7ni5ElBUOZAQRoXI9e6Crhffj4mjhq4MS8mz1f0y3UkWhO2newlUtFeNu8wWL30FTbk4JTnNaXVOOAyj1+AnJoovVqp2tJijxjInVseKLrmwj5Reh494ibh5T2SevMCcUXb4pSUkk/Rz8ivuiBKxEguIgcKEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771836353; c=relaxed/simple;
	bh=8Jn+9bAvm0kQIymOaqw76fCPzCInW2hdIe6l76PNf8Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bALitA53umBDRNR7X+WCz/UHFGMMUqFiZC6bkgnWakps+EOGpEEPth/S13+oexFr+DXsgvpsSDxWiEMAM7FlRK24NMLKZyjQaZ0T6nxHzjcLWaSpHl0v3GHHY59NKX84BzszrmPaA8J7B6HnQWN/lNiebB+l0DlHYYUO3wvBCYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EDbFHxeK; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EDbFHxeK"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 65B78C0078F;
	Mon, 23 Feb 2026 08:46:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4A9825FD43;
	Mon, 23 Feb 2026 08:45:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C0257103686FA;
	Mon, 23 Feb 2026 09:44:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771836288; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8Jn+9bAvm0kQIymOaqw76fCPzCInW2hdIe6l76PNf8Q=;
	b=EDbFHxeKAfGw8+gnLFRq6tQC0uJRJ7Yurql72wpaI+ckTM5ucON1jvgfTKEauHmjNTz15Q
	F0GV6MJB/cPxcxtlWRCh6Ut1doiuDBN72GVii/bSslx7qPojIuN6WQtwpwmmg0EMd9udti
	hXBEhctUmZV4gK6DZXF/tvLj8nfhfS8cBlUeT2kznoHFYf/QuU6rvcXwVlkBChlGW1JB+a
	jD/t0LGvF9+zBj33MG8DxzhaA7Y8Ob2+muzb0W8obUnqhcVLE8i3ZkDGlwhj5/biyW9+4Q
	po07cWOqGFZsrc8pul5Y/jPwQ3dAH5zsEAP2HkQy7hs5BvE1fbJmw1Ixfr4CTQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Gregory CLEMENT
 <gregory.clement@bootlin.com>,  linux-usb@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] usb: ehci-orion: remove optional PHY handling code
 remnants
In-Reply-To: <20260221-ehci-orion-drop-phy-handling-v2-1-5e26aa73790b@gmail.com>
	(Gabor Juhos's message of "Sat, 21 Feb 2026 10:02:37 +0100")
References: <20260221-ehci-orion-drop-phy-handling-v2-1-5e26aa73790b@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 23 Feb 2026 09:44:46 +0100
Message-ID: <87tsv7rgqp.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 21/02/2026 at 10:02:37 +01, Gabor Juhos <j4g8y7@gmail.com> wrote:

> Since the USB core code handles the generic USB PHYs automatically, the
> optional PHY handling code has been removed from the 'ehci-orion' driver
> entirely by commit e04585184dcf ("usb: ehci-orion: avoid double PHY
> initialization"). However, the devm_phy_optional_get() call has been kept
> so the driver still gets the PHY even though it is not used for anything
> in the driver.
>
> Drop the remaining code, and also remove the 'phy' member of the
> 'orion_ehci_hcd' structure to simplify the code.
>
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks!
Miqu=C3=A8l
