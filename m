Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3BD1F9ECB;
	Fri,  6 Mar 2026 00:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772755307; cv=none; b=DExm1xpYBGUYUTG6HKPJxxRfyqy9F7IczJlCiPEaCWxYeihynWZuQTeaOltlELVOq7zXxYb2wGqFo13aq9wzFZbQNDfTOOcvpZjk/d/rxQhlAZnylskaYKbTH0BeAebYHDZZSk2OdoNemvQz0l8DEGlyyKaduBkQyjCTfqjBnqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772755307; c=relaxed/simple;
	bh=c1lXhQ1N4Yqb0fQb9aV00aSe2DFNy8bdG2Lt1TmCyHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bA0usKN6QHX4LPgAPOteJDmYONO74v1lNm5o4YsPfNJfiIOtrNd29pAtIUuo81PC5eoTMKEQjQYMwogz29wmZ4odolDhIYfX6dpceF+uzEsEdDdOUacFsllXjpF+xgCAB93W518CXFeoMGpPiBaakt/laV/bI+jZ+f6QhU4MgHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HPEHyRqH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HPEHyRqH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03336C116C6;
	Fri,  6 Mar 2026 00:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772755307;
	bh=c1lXhQ1N4Yqb0fQb9aV00aSe2DFNy8bdG2Lt1TmCyHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HPEHyRqHM85385bHXpusyN0ZSAaW3V6Sgds6cNUoqc7kzgEq1x1YQ1NGltn0SDLtb
	 m0vHtw0BGIOFfgDgQXIE/wde/SIPVRn/D/qixBYVmjcOkR209o29/SwZtCoa2Twdo5
	 4qE0WtDpy4lLWUwb864B1EZwFgaNbp8sQHqKre1dqrFPhFF7ailrDp6pW9p5kb42Yx
	 3l5tmL21+GRrR72QSRykv3L9lykouQR+PImRHtuxFJPo9+uEu+R/E0LF3UsVALy4yA
	 hGkXil6GlEVOyBhUrHOSRg0abqG0zMmSW5V+M7fBGZX0YWGd8vB+jNdBAYeP+LJfQn
	 2HyE9tHa5wjEA==
Date: Thu, 5 Mar 2026 18:01:46 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	kernel@pengutronix.de,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-usb@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v5 3/4] dt-bindings: usb: usb-device: add usb hub port
 vbus-supply suppport
Message-ID: <177275530574.816904.418893942836777116.robh@kernel.org>
References: <20260223-v6-16-topic-usb-onboard-dev-v5-0-28d3018a8026@pengutronix.de>
 <20260223-v6-16-topic-usb-onboard-dev-v5-3-28d3018a8026@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-v6-16-topic-usb-onboard-dev-v5-3-28d3018a8026@pengutronix.de>


On Mon, 23 Feb 2026 12:27:36 +0100, Marco Felsch wrote:
> Some PCB designs don't use the dedicated USB hub port power control GPIO
> to control the port VBUS supply. Instead host managed GPIOs are used to
> control the VBUS supply.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/usb/usb-device.yaml | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

