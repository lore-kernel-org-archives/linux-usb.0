Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CD73B38B7;
	Mon,  3 Aug 2026 13:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785763455; cv=none; b=AGtavSUnSFhH2W5OSKi33i+Ojogmo1WnL88aXL4j5BuoNmPIFdLyipLQHG2nf24yra0eDV+1Ksp4ouLsTPDXbsSSXRLIUuyqZQgeNg9Vc3+u67/5Edd+Xk80FMkZ6fRmus9XmUTr14Lim+E8NjTAdhLD2yMbs191enhm0wMvv8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785763455; c=relaxed/simple;
	bh=MykMrv+yNqsHxDJcjhJ+8zmtleFJi7+mJjWEpaDod+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u6VwQWmb5gPSbDeoH0h7+YtSICNAiYwjIyqNhxt6oHV7F3Kap/GO+lrg2ZfCAYOXi1kwqlhQnh7VffoFWwSpzD9gQYvuWpTnaaz4+EB/1r4A/3k7B+buFDTVlpoS+ObHqQmxHUXAEMkakVfBIRVg3T5pU+rpd4y98bga9xt8j4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SV0fH98W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SV0fH98W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA8CF1F000E9;
	Mon,  3 Aug 2026 13:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785763447;
	bh=ewIzq0LibUQ6nB6UeoGja0UgNFI3wXy5HatxgQmIUJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SV0fH98WZVDHS7kV3MtroOyYATNwTHsNidP7OGsD9j1V4qyH+YZ/Z6Hox1QZ1jNA9
	 3jdYzqqt6GOMDx+cHMzWLEllGzDiDSbCMjaRF+vYEnhYSnwCC94E1nTW9rUHlDmzKn
	 /ttUNPZyWB/8TRiK8Ze4s6IhSF/MxJZrj+la7KbmuQOJZjSRBpr7BKObrhLpco39Y0
	 URWIpqf4GWuOtmtT2OpMhlAdLWgyh9RRr//v6IedvZ8H3Nv7xEq9QBgHh9mX5Vopcx
	 /56VW0xcJQdfq4amODpFS7ibeYomUH76DHpLhbXjmoiMMW5mHjFNlStxVhEERporJZ
	 6XaUvT5CgQ2UA==
Date: Mon, 3 Aug 2026 08:24:06 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, Julien Stephan <jstephan@baylibre.com>,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, David Lechner <dlechner@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: usb: mtu3: Add MT8512
Message-ID: <178576344579.3104650.10771178654777991535.robh@kernel.org>
References: <20260721-ccaione-upstream-mt8512-mtu3-binding-v1-1-2f229c39f121@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-ccaione-upstream-mt8512-mtu3-binding-v1-1-2f229c39f121@baylibre.com>


On Tue, 21 Jul 2026 10:00:28 +0200, Carlo Caione wrote:
> The MT8512 USB controller uses the standard MTU3 device MAC and IPPC
> register layout and is handled by the generic mediatek,mtu3 driver. Add
> the SoC-specific compatible so the controller can be described without a
> legacy split node.
> 
> For now the only user of this is on the U-Boot side but we want to keep
> bindings in sync.
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>  Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

