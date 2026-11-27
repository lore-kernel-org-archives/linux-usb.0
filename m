Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777027;
	b=smrcUcwTaRX6Dx5zqApu18Bu0Yl8RU6uaIA52VkJkXu8bf+GPBNfnWJzn0QfNZa/d973
	 6avbMFz0n51mdAZcdRNN7YoiE0C/jjOTnEuwUy5AxyQqaO4tViKcqk4TztfLdvXnd1ILr
	 F2yLJ9lgDflbZsU+lChfMZDB10URQalAN9S0C7KsaJnlM08qaYnqL/ULgcNwSkFdcQQfi
	 Tigw1VI8YqeLvi2Ftb+J4QJ0ufsPmp/DgeB7cXJ9o/gZ4kBAJk2OsgV2bsgjwDKMv6omI
	 pqL2gmrq2gWwp8rqTWxmoxYr2k3mdl8pHh7LzkqeDbbDaNxVSCS4ovRXpmby0Pxiikg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777027;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 User-Agent:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=0LtKJAAbs8SQGbCbVA/vX0ALvQNPiqa/AqqyugfllD4=;
	b=KMPza4uASL9RJswsROAJf3eacD4AZjfUpgk9ML+sNNDQhMVKS2pOL3HDbbVEEz245Hbd
	 xjutYZ9fCx79hXU9gY+1zaXYwKNzyMQvyaZHWyR0Gp9tLWkOsfbOg+lEmoyJxKs1hK0T8
	 xXd0+6qIYmr80jU4QDY8Pz7zWgNU7Nf1JRdXrkZy5xFQFmR9fGdGUqI8MUJRig33ZMNFT
	 EP4BNe9xOGTObhWLYlhjZ+hZ2ni3HvFXa1vIXYCyIoagZw0QE+jMsksHjyMjoxkEJFeNJ
	 2kntS7Wt75TkTNDkJ3CO3P3d+dZt8nlCrqXIkrPObkC/P2JlLEb4eZS7q9PsRqsriAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=tAWCSys8;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80662606A31C
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 10:57:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80662606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=tAWCSys8
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B97FE4E417C1;
	Fri, 27 Nov 2026 10:56:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 85D4F6049C;
	Fri, 27 Nov 2026 10:56:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AF2EF11E69316;
	Fri, 27 Nov 2026 11:56:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795777016; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=0LtKJAAbs8SQGbCbVA/vX0ALvQNPiqa/AqqyugfllD4=;
	b=tAWCSys8QPStN19HQGpZEq+DzIxAdvxTowWa5pHoobsgI91u4P/LXzgqjJB8H8CrdqKgkZ
	6gFo/sdqXdSrXJzLJnV26CAPdqKz1BHbDtv/LkeHc2c+JhokuGXldhGnZqkunHLKgxLRtV
	uOTtd2rifMKmppkaYA0Fuf2inf3HiGlj1EQy3we0+4T9IgoTu+KI/h6ZUHl3VVJX5qRVVK
	uUK0elrmtNyY2XV5ysWd2WSjN6k0gPHloHQgLRfyTBzn5VF8O05TrLZaVnoT0qnZOK3WR3
	VZNkeE55ezdSrE9yAnRyM5Scbb02fnYFT1PfNCkN8d9eMRb83a8BJyjvWgSw1g==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Ajit Singh <blfizzyy@gmail.com>
Cc: romain.gantois@bootlin.com,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heikki.krogerus@linux.intel.com,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: ti,tusb1046: Document no-hpd
Date: Fri, 27 Nov 2026 11:56:41 +0100
Message-ID: <20261127105641.16941-1-romain.gantois@bootlin.com>
In-Reply-To: <20261126093819.76480-2-blfizzyy@gmail.com>
References: <20261126093819.76480-1-blfizzyy@gmail.com> <20261126093819.76480-2-blfizzyy@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: koshi/0.3.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hello Ajit,

On Thu, 26 Nov 2026 15:08:18 +0530, Ajit Singh <blfizzyy@gmail.com> wrote:
>    reg:
>      maxItems: 1
>  
> +  no-hpd:
> +    type: boolean
> +    description:
> +      The HPD_IN pin is not connected to a usable HPD signal. When DisplayPort
> +      Alt Mode is active, the device is configured over I2C to treat HPD_IN as
> +      asserted.

IMO device tree bindings should not describe configuration procedures,
only hardware. So I would just limit this description to "The HPD pin is
not connected to a usable HPD signal" and let the OS figure out what to
do with this information (in this case, treat it as asserted).

Thanks,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
