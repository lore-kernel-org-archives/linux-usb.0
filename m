Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DBB4749E0
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 14:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786114802; cv=pass; b=BKew5jFuRXq+/207s/mIbgihfk6bJf0y/ajinXOUDmAgLn7XapiWZEMP57FPgtlGN9fSikkphK1maHVpbuM4mtJtiCHXj9z0IpoZyepDaqDalmaUp11QPshkseyCFZTwxIMjsZZFijbOWmi9UY+tLaIZsDPG7y+iKY6/xUIbw7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786114802; c=relaxed/simple;
	bh=gV20Qq1q8KHAEqMNSgw5mTDYx8Xl3nfNz4w7UDZshT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A/I9PpEactma0nd6DGysbo+hzcPQ9Yds6xTFzxlSwi5HH1op5YFHatfZB3WlvDLdMxCQGdizLMsdYYX8eX1E/igsddS/oqI9I5wJLjYHR2cYirJ5QEAdMX6yGhiAGTHkPoFdSSD8KkqYtAZgHNaO7V6argEInKzHXo8JC1bfETA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gyl+qiOJ; arc=pass smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gyl+qiOJ"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-976ea28c65fso1952189241.1
        for <linux-usb@vger.kernel.org>; Fri, 07 Aug 2026 07:59:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786114799; cv=none;
        d=google.com; s=arc-20260327;
        b=PRnoLeUFa21gbNiLr8wuruQI4/w3u0Q23+AnDFek8WUL8Ff5jreUnNk099A/lDJTVP
         I3l5xTuBYbEkRfVT9DnNyxC8R6SR+KHgr4n2TsBs5c1lqyhzy2wjfrT8TzdSueYh4JBn
         m0W1BSy2/dPla3iEL3ezYyQhhtwrbcaH5JZxAu4+VVhVxDsO7VkutRZcMXWR9sdh0Yna
         mjOuTelNAWulfnPOG9MIKBcwo6/326ayBYNXLdwiCRmWGmbtc9igFJDJdYr+2puwnwn6
         WH+z6UtXWY4FvGY7xgms0xCisoa9fmztWkEnlFwMrzjnPezc/XfAO3HOkom1DD/qt3rp
         OKKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xvuSwihRV3vLoITfKBXt24sePvRgdmUhr3+yUrenF18=;
        fh=Ih5ENuCoU09zXsxadRxEZxgFXUqcAaZuVLI+ptXHQZ8=;
        b=N8SeTSTBuemTWnbcg5uDVDuhe+1vIRP4U4ER7nb2djJHrLnojcx0LBWVY+hQcuvOWf
         ncpXC+xGi8smewjJmww5652nBgSZLNZjglosKYht6GuxDnuMVUo8xfBaQ3NhBIoXXVfX
         QoOTBO0w442+wThw1LNHPfUANOlXuRLxipMg6TS+8Hd5hvycgJMUCiG/HGJek8pU4NKA
         +aJXJCk+FjM9CIz8qt+SUnRNOlf6vi+q9uwPLClLDbz/BSn0/uBXrjpCGLmrwPjBUTj+
         hcQp40gcNpSY/oXdLq302TR3qIH7+d3DVDMZTgKK4zyNNK0b3mBt2LQid2ZbV6Uz74+u
         hcNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786114799; x=1786719599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xvuSwihRV3vLoITfKBXt24sePvRgdmUhr3+yUrenF18=;
        b=Gyl+qiOJiAmjPzSOy+yAUbgHE7C2l5ryrcwZj7SEstdeZ+RQ/gj0b3pqLcoW8xI+G2
         w2S7/9zA5bbP10Ap0l2Y67e5QA9K44vSAFVIWbKWgO6Z/6LORJD2qArzV6qC4vK4fVhi
         eMxU0mH8NslkObuipwS/rQBTeJrw5of9PMksU9uX9cTRAZW3bLaQY6gq3kblSvGOAJvT
         3U2CmeCH60eiIbrMmDDH3T+kowUcOpAd++FiuYPTcTvC8T+++pRDc2WTzkLjNMsD0y8b
         mryaobBDYudLE61t/mF0Znw65XqqXKH37ghcuoyZbB9lu0pIgHgMsV332cNNIFOP1TRa
         E9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786114799; x=1786719599;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xvuSwihRV3vLoITfKBXt24sePvRgdmUhr3+yUrenF18=;
        b=l6ugnPGqknwbbRluTgm5M1EMUL5sgvK16WGk4DnCk89pydhK7E3BSBU/dGKCTJTSp4
         cpFxOV/KeLblUwommUC46OQnjgIkiQ1RxSbPHmotSuPMkzSpalEFmVXb3MuEwFaA6Nqr
         wZ055shgYtzyFwFoHn0LU6WitL9/lTf3a6wd3Z30ocqCYWy/oO30hif9zouuzxaOUH/3
         nv9s0UPtZRB2YDTixJ6jLZRi6VuOAJ/nGg5rysMBE1/OjppeE+LWQkdoEANbWDJdIeTE
         3tuiJdA1uu4F67Lgno1AsMaAfjSN2uy1wo2ByOnDM7G9D591EU6tMzavpXtyIagZSmKN
         CFeA==
X-Forwarded-Encrypted: i=1; AHgh+RqDJdcRXB6yYvMrECgwr76O4dUtnELm5IbAfh9BV8EAjM6W6V6boZGVXPRydAR/Z8SeQn1fM8ygm3E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqwOBswgGvGKi50JG2kUa79DUjxak9pysQypoFq5415vkXw7Wy
	pm2t9BwvHv0P1lZJYt9CXghOonVgXONTaLLNtKsC+HrdSPkbqkRy0RPGxv50K9OsEQTT64yEWk0
	Vh87XdTZeL4UuQv9WBsA4istB9pn51eU=
X-Gm-Gg: AR+sD11gZv5H0uBGMm0JNKBarvkFbDdd/lC4s3BU5KOVaCugvJOHiDOjWK4M4AiL4xl
	WQEdaICZAGNeJPyQymk6DUYvmKNsA7GsO86B15o8MkQ4otFKuDSaueALtjkbJrX6EcLIOzjCVPN
	QmYIs7N7ahYqg8uvrK8NILDKFxtZMPhRXjSG0zMGXesjjqkoYz1w0PTdb1E0QTDpY7sKJNsv8OG
	eO2vE+I4bzLmrGn0ckQbWhX9KMlWz0UEwp2gYAUJdXGLkjHo7wgSeiO/qeIDIiJmnY2xDLYAseT
	z0K96T7Skam6wnpjY3kXhip4Owljn3gu1RJ+BNm5SyBl59M0jpWt/hq79JKUA1SmDsWf5wWt6Sv
	KhXrDrMOU389xF3u35BX+RWOfGhFDgquA3VxvK7lNEb6FYp9j70FGsC6EwOlUIesQo0b2fg+sr7
	xkvPJunJYA7mIX02Oif2o6awPzv9HqRGTWX6P/
X-Received: by 2002:a05:6102:54ac:b0:738:bf0f:d0c6 with SMTP id
 ada2fe7eead31-760e3b9ab74mr7413161137.0.1786114798682; Fri, 07 Aug 2026
 07:59:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806-submit-mdio-of-dynamic-v2-v4-0-4beb0c50d5ba@gmail.com> <b2e83ba0-2e9c-4105-b806-8a155e8b9aa5@lunn.ch>
In-Reply-To: <b2e83ba0-2e9c-4105-b806-8a155e8b9aa5@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 7 Aug 2026 08:59:47 -0600
X-Gm-Features: AUfX_mzMI4rGrSWJxil0rkCdGHQcdQSp5kYsnGxukt-NVGzxhhYkib-rvufG5PE
Message-ID: <CADvTj4rame1n8eQL2GUOaJHnOcR_cqNxzNYO+QeCLYDczEFeUA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 0/4] net: mdio: support dynamic OF device changes
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Richard Cochran <richardcochran@gmail.com>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Jonas Gorski <jonas.gorski@gmail.com>, 
	Vladimir Oltean <olteanv@gmail.com>, Ciprian Regus <ciprian.regus@analog.com>, 
	Andreas Larsson <andreas@gaisler.com>, Mark Einon <mark.einon@gmail.com>, 
	Iyappan Subramanian <iyappan@os.amperecomputing.com>, 
	Keyur Chudgar <keyur@os.amperecomputing.com>, Michael Chan <michael.chan@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Doug Berger <opendmb@gmail.com>, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Wei Fang <wei.fang@nxp.com>, 
	Frank Li <frank.li@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Jijie Shao <shaojijie@huawei.com>, Jian Shen <shenjian15@huawei.com>, 
	Bryan Whitehead <bryan.whitehead@microchip.com>, UNGLinuxDriver@microchip.com, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, Timur Tabi <timur@kernel.org>, 
	nic_swsd@realtek.com, Byungho An <bh74.an@samsung.com>, 
	Steve Glendinning <steve.glendinning@shawell.net>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>, 
	Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, 
	Thangaraj Samynathan <Thangaraj.S@microchip.com>, Sebastian Reichel <sre@kernel.org>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 7:16=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Thu, Aug 06, 2026 at 09:54:19PM -0600, James Hilliard wrote:
> > MDIO buses enumerate firmware children only when the bus is registered.=
 A
> > later devicetree overlay or status transition is ignored, unlike on I2C=
 and
> > SPI buses. Supporting live reconfiguration also means that population a=
nd
> > removal can race address scanning, PHY attachment and bus teardown.
>
> Please make the bootloader work around the issues, and drop this
> patchset.

This is just fixing OF_DYNAMIC for mdio now, it's no longer used
by the AC200/AC300 PHY patches anymore.

>
>         Andrew
