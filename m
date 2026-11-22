Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795351690;
	b=YQLNL2WOSj885YBCehQ2BjQle2dTiws9hmN4x9XLrlQ6fMGH590si1dfnFF6un0+h6vR
	 oazQ6MbnVsMVpHIH0sIPMwNVL6tPiBRvq9LX5Wpg2st624b8I1HphynINS9oGWBKVthQj
	 mEQrh5AkMWWX4Lnr71nwOT9dyOFGq5dsD/neOGt/e8rNl1V11SFj/HhuZemgDn56Femmj
	 /4PxrPPTmBXtLJx6/7wrKjKXs5yjrfRJ0en306k7ACA23i0ZGw3KXSXzvCxL4PJLw0DYA
	 BAq0Lg1ucpGiotitUmq+Dxendd0fO090fk9cu5g7DoWnIbREA0jHpWJv5v6b+4MiCRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795351690;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=0SyiLVafVLoZvClF1M2gLD0edDiw7Zr34cjvxkuhDOw=;
	b=x4RMNv0Qij2XE/53tqsW34Y0bEscPhwhh/wD3Mq+vELLWZDw06902YTK1O3I56ZxIh9t
	 q7Y38aAo66e+PTGdYykrZEGKqq422MPmyYZqvmoaUIhI4hN1CK1w5lt2GqRnVx0MnZrpk
	 0ilS0V/JUcFg4VCkHygpqVJ0PXMaOzucOPzIeLvQFwERtbYBQ9J6WuFy4NcJAOU6w5GPs
	 M/X2CE7rZ133eTMJgOHLokmDfEif1l6a2uw/6Ch8f4hQEc8eUV/iIX0rIi8JA9z290hdK
	 qA5zRVRDpBQZTWzk9OVFiITbNqME1PtimhrPJ+EAejdj5oRXUFAjSSNRcHlMU46eQnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8447606A320;
	Sun, 22 Nov 2026 12:48:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8447606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xV6zE-000000002EZ-0vNy;
	Sun, 22 Nov 2026 12:48:04 +0000
Date: Sun, 22 Nov 2026 12:47:55 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Birger Koblitz <mail@birger-koblitz.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-usb@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] aqc111: Correct endianness handling in
 rx/tx_fixup
Message-ID: <awLkXL5ov1_r3vX9@makrotopia.org>
References: <20261117-aqc111-v1-1-27a54c4b54ca@birger-koblitz.de>
 <29ba76c6-5feb-4f07-90b6-20468b62d602@lunn.ch>
 <407c557f-1d95-4a69-8cf6-4475e769d65f@birger-koblitz.de>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <407c557f-1d95-4a69-8cf6-4475e769d65f@birger-koblitz.de>

On Sun, Nov 22, 2026 at 08:38:40AM +0100, Birger Koblitz wrote:
> I will re-send, also taking the comments from the LLM into account.

Please lso fix the Subject-line to include "net: usb:" as prefix.
