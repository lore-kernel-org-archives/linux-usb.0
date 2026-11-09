Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794185140;
	b=wB5lBStJqifZakVe0aI9JW/6B7d7uZWOxAQYDzM2uW4ghxwefUa0DDGxBNRI0gOEc9dc
	 Z2yqqXM+fbLLSxU6p2vcAudAO9fNZUDT0j4TUUh0OvlEMyk09nBujVSgjDgJN25P2b8KA
	 pO+Vl8td6CveD+KGd4ONAPMrsPUzdIWQjv9NhSUpx4TLgdGTLybfFbS/g4oAwd/WwSsUc
	 qVlfMoRDFSDQs3EFz+QjqdpIfi5WOzQPWz1dQc+9P+kKZ/I7J8/YC1LcdNgxQZ2NDd/TI
	 Uje6j6F6+aXQhmZ/nQb7YoU/Z7Lpph6QyGX2zkL5O0Z7J/Ou7V4mTXAagGQD4O324Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794185140;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8XPpJLT5DqqGeuBuhAhcPTkDvHKu14SuxAjhFDq1t3c=;
	b=4PyceONT95nUAJSKQGykwR4IjR6SadwZSUjIyvDu9ZDMxsRy9PViXpMpQqkxPs1IFwyE
	 cHwRAT+BeHo/HIuSCJJbN9cvh48ebbaPBDFhu52w9g110fceZgkLJvNNqdjm3yya71cI/
	 8BsWGNf3XujcOZ1Ano15RvIDY1NQkVWe+HT+69c0+D9E1Um39PXbdVMrgD8a9KyoJnVp2
	 7zxIjIonzBO19Hgx58nYLO9Th7boa/FaX+d7HciBysoWSO5DrwsqMHW702j4dZ8mOSN7o
	 Dr3fQ30hLYhjaymqcmUI3IR/010pTtGf6D0HlC4nVTiiXfFDAnMDDXyOiMaJtYv8OGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mHhb0JEj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CC7606A32A;
	Mon,  9 Nov 2026 00:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mHhb0JEj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C69BC1F008A1;
	Mon,  9 Nov 2026 00:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794185140;
	bh=8XPpJLT5DqqGeuBuhAhcPTkDvHKu14SuxAjhFDq1t3c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mHhb0JEj4MtQa68yYYW9P6c0vw+XFt2cmoFl3FDQeiCOA/kTaMLxXo3OPA8PC9UKo
	 0NleGeupaNk7C8cUBS0YVcSajG41n12Z5V0k0e6ezLhkD5Hzye6wAT0x+SQWbLM4TN
	 DJnpLtiZdBqJFkOLE3yvy65sRjpPTQVS7Yn1dNcxfq3JqyO8mdD+sAOcl6xeAOYuvX
	 6AOGxhNnTQzVJ7epek9M6VvWytI0921KmntqKOlqMqH2d2W5S6UCFmr/7NQpUMpzVC
	 cKmlQa96gtV0TZiIGmHAsmK4qn9byESdsSEUZQ2PF2GehI5uxme22NAuGESS4qL3kl
	 osy4GFDRyRXAQ==
Message-ID: <sashiko-outbox-204253@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 14/17] dt-bindings: interconnect: OSM L3: Add Halliday
 EPSS L3 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Aleksandrov" <lightofmysoul@gmail.com>
Cc: mfd@lists.linux.dev, linux-usb@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261109-halliday-dts-v1-14-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
 <20261109-halliday-dts-v1-14-289114ab8197@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 00:45:39 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Document the EPSS L3 interconnect on the Qualcomm Halliday SoC.
>=20
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-halliday-d=
ts-v1-0-289114ab8197@gmail.com?part=3D14

