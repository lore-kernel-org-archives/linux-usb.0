Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABC85372D3
	for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 11:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790075000; cv=none; b=MZAv98goxTa4OHIboDXia2JQK1/ORkM2lnRix/k9vEvbMZ4rn+ZQhPJpXvqShEyV4GUv7zWTyrJ/baJtXwgcmQo1dGfkt/wuEQRUE1JS1Q8IBcFG6bKK25CoZ4owhxOukYDgfjzAnV1Xo/YyvJGUF/ShlZGgE4Hit9mLAt7XQIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790075000; c=relaxed/simple;
	bh=AKXo4HFyGH+qOtzhSzfVmyUzvAxDbIKAOw+B0wfwJ/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=er8FjU8kFkQwAV+RePkyVDDYGGItwqlt1WwmQCz+0+lEtmSoAGKANNCGSubhpD8/U+PFbwi/0Ghf3qzPSKvhzN5NbYa/oN8yhL1BZAtiHS/eIuJYwCZmOPfMWCdC+YWQZPqjcJDO20rKLMcRXbb2UPthLrY0uz9II4AnvzAa/zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=Re0GYu4S; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="Re0GYu4S"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b965f447cso33957525e9.3
        for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 04:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1790074998; x=1790679798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AKXo4HFyGH+qOtzhSzfVmyUzvAxDbIKAOw+B0wfwJ/s=;
        b=Re0GYu4SyfK5Lso5wuUrGXWsmztb++hqnMp+ez0X7BtQj1KAQJD6r/kNUWsdKU9e2S
         h/kmIHD8iHd6qKR30qub41YANqNlf5E2sz6Qfl6SuVUsXdNE1+Cnj08zknSn2cW7PqHX
         rxCWmnitCxgzkmqAfG/ye/6RjoZI9lbssLO1/b6FlMaWs10vKnw07fcWaGXeIUv1tOFv
         s2ili8uiFjg5EKCdZcqBviCWpZwDgfN7qmm2it3taECCZWRsV3NlCYE/2wBkdYuRN4O2
         QSkCBXmw6d9zWTL0igkSb8y0TTTvwWQdwRhrogdgFOhzV/g11uUQxt+EbJvq1rNjHjZd
         VLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790074998; x=1790679798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AKXo4HFyGH+qOtzhSzfVmyUzvAxDbIKAOw+B0wfwJ/s=;
        b=tub0/LJIKK4vU/IfDwbSrSJwA/WUufh9YSWU6BU36C651xnpOE3DIopT/uWSrl3i0/
         FXOB67lFm8mhXHfO5V9z8qetn+ppz1NToRH43AXgNXvfhVpVxZCxTa+0SfioRBAklKnt
         fnZaRS2XpRRvuS5wTqjDXfX7cVj3AO+Pn6R4SMttHrAvyfN1xK9e0B675etJba5KmmTI
         nOw1RAeoWR1uf/mYCp0zdkdvNiJU7hvUkSITYB7j3k0tTrfh5uve74Gpb2xdB1DKO2a7
         yrRcaRIITNNWXZIyARUugoz6OY6O0MKmCGg6IZOcMX5PKT2kkxtpx7T6TnN0hjAlpDKr
         tt9g==
X-Forwarded-Encrypted: i=1; AKwUvBxmA9X1kqVTqrQhn1DSqScGLCFHHg1SCcerin5NmEtEflp/dRSsIlQBm/37pkPDjlPiBBaXTlEyiKY=@vger.kernel.org
X-Gm-Message-State: AFuF++m7uvQyWZ2/Loisas3Skf3F1jZarMb4VjcxwSAleO3kCkK10hos
	USfUx0zHNLfF4KccJq+pQl+vQnPcMbRLXEw6WXQfqkYy9OrschvniFmYHDU19ulMuIw=
X-Gm-Gg: AYBFou2Kxz+nn3TmexSZTKdw2Wk3lbLmWQW4tYdrkbDibJ4AcGa9XI3ZAC3MJ5oHbq0
	SBqR7Wxnh2OCRXaYi/l9xORgold5LAVqEzsc+xWjbkm/QDEK4mNFfvemuC9HnVOQ/B4nQUStvzH
	TqA9mnTe1HAUrqKnQM8UDYpEfMfVJYXtWGm/5UXCz3iUid99pkOiu08ChRLB/7uCO9gcmG23vBp
	YPXg4qgYMyUm6ua7YYaL/6m8lIKsyq56a57bzG4f2kd4fuVCkho7l14gHvAf+R8sk53dzMQ9IQJ
	uNis9TZVBSwWIEQjoEPfHVF+BmevNlGph2FdZFN8xnFPvBiYNHqRITkb+a8xXNPfLJLtfW7k+WK
	rn+od9V3zAxrDqMF2Gyev48hkRIVkHmJzSM270ubKDl9ni3/HrbDp3L4XFgili0Y3ZZywJrxNBo
	naAdMpb/N2P5ypzH8MoWTonmUXwkcw1uWrRfXr53I5l5jOalEw3Q==
X-Received: by 2002:a05:600c:1c20:b0:49c:fa20:cc07 with SMTP id 5b1f17b1804b1-49fc5741914mr220584495e9.30.1790074997555;
        Tue, 22 Sep 2026 04:03:17 -0700 (PDT)
Received: from remote-01 ([84.17.55.230])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdab0c240sm29990795e9.4.2026.09.22.04.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 04:03:16 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: netdev@vger.kernel.org
Cc: Aleksei Sviridkin <f@lex.la>,
	andrew@lunn.ch,
	andrew+netdev@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	olteanv@gmail.com,
	Thangaraj.S@microchip.com,
	UNGLinuxDriver@microchip.com,
	steve.glendinning@shawell.net,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v9 0/4] net: phy: keep a PHY interrupt across a generic bind cycle
Date: Tue, 22 Sep 2026 14:03:14 +0300
Message-ID: <20260922110314.4028755-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260919015326.499479-1-f@lex.la>
References: <20260919015326.499479-1-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Andrew, please don't spend time on v9. A v10 follows with one code
change.

The store in phy_detach() moves inside the generic-driver branch. As
posted it runs on every detach, so it also takes the value from the
drivers you listed that set PHY_MAC_INTERRUPT in phydev->irq alone,
which is what you said genphy should not touch.

There is a second case for the same fix. After a failed request
phy_request_interrupt() leaves PHY_POLL in phydev->irq while the bus
table still holds the number that failed, so an unconditional restore
hands that number back on the next cycle.

pw-bot: cr
