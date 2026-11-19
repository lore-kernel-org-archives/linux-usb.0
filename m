Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795121733;
	b=xSdfMgwLEELtBaielaNfGaR1fHavYByXrULK+8MTdbz+ZRBw/c6MeXA9c/2vu+1nXxnw
	 G1yDRAjrvAV6ivU35M8vZEtnmBe5rdpvLji0v/MOhYlCZAuuhMereHMpVl1LwJfM4H3Z6
	 eDLvVLG1wbNh3BecE9asClA1YxgfCBoRQ6FNFpLlzlVbB2jlLLajTne0drfbGT9t3KB51
	 KoHkrUl+hbxnBkBwLYPxnEsl7lKGSSzhMSm74YIZ4sxogwcjO4bjZWCoebMBURwOWQbu3
	 SLSEuOeuOeDhkjJymSTZL+PeaQLcI+7mRqJk6q3NrAy6J5Ti3ScPb1Pol+fTA5aM6ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795121733;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=jL3UjUhZBMVDkYZ9sJMfrjhv2cZhAlNrNCCifrd/kv0=;
	b=tsE2xhs5XC2pS/kCAOEIGuSf45VWtdZusGUvgD+vumB8OVVVsmAz44Sq5sow7N8jJqPQ
	 SXe+QSzjBCkXo14QOvBDwrHuccmGXw2ExSod6STAxOK0WqV/8qy26p90KhzF4MrH71PkZ
	 0a5FaxxXcnAYwyrYX9iNVSWkcWXayS7ZmhomzLwzRMKSg/vTKQ8bKgW984kBetmX05tfd
	 pJsdGYezC60kKQeIy1NzXEUj/8YDYrF724k0Hk/7/JiAmm3dT1L0XTsIcbeiQY3SzWPUN
	 vW8zBsaEBzJ764F97qj+IKLA7/YJ1UjwofBiMmQVRVeiBz5ATubd5ZRA17Thw4VHqJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dVUrxvh+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD48606A325;
	Thu, 19 Nov 2026 20:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dVUrxvh+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20DAC1F000C6;
	Thu, 19 Nov 2026 20:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795121733;
	bh=jL3UjUhZBMVDkYZ9sJMfrjhv2cZhAlNrNCCifrd/kv0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dVUrxvh+bCXq4VfGmxfTraUJrbPPYpwz/NfDSYuXN4DaK5cR+vgCr2/VXSgj08WwF
	 /QVdrndkjD4obc8Y1A4F5Ws8Dc0AJpFq8YS3nP0ZEhxGUlCyrC7IwwkWaFDSrZ4lyg
	 ZNB/R8vNZlV0ShO5GwyU8BA01DxTLRqVhfXSQLczR+Dl1qFT8Kc02f4m5WAPoOAP0y
	 /LPU63vdlyN9eFOj/JnP0UpOYMn3NiykWkQAhEI4JjVliqD26gzO8SbmOlig+0P7Gm
	 bc66zK4ReOos/YVb3gBRJBslUZ2Cq8tFK1H1+Uw/vpeabhM/eDdXi7d6pImmQrQbP2
	 T7awCOHr3xGpw==
Date: Thu, 19 Nov 2026 14:55:31 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-usb@vger.kernel.org,
	Macpaul Lin <macpaul.lin@mediatek.com>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] dt-bindings: usb: ti,usb8041: Fold in TI USB8020B
Message-ID: <179512172653.531258.8575247856427034677.robh@kernel.org>
References: <20261103095425.3097720-1-wenst@chromium.org>
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
In-Reply-To: <20261103095425.3097720-1-wenst@chromium.org>


On Tue, 03 Nov 2026 17:53:29 +0800, Chen-Yu Tsai wrote:
> TI USB8020B is another USB 3.0 hub that currently has a separate yet
> similar, albeit more limited binding.
> 
> Fold the TI USB8020B compatibles into the TI USB8041 binding, thus
> allowing the TI USB8020B to correctly allow downstream ports through
> the common USB hub binding.
> 
> The requirement of "peer-hub" is relaxed, as done in commit e44297dd2b75
> ("dt-bindings: usb: ti,usb8041: Support nested USB hubs"). The hub chip
> might only have its HighSpeed data lines connected, and thus would not
> have a SuperSpeed peer hub.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Cc: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  .../devicetree/bindings/usb/ti,usb8020b.yaml  | 69 -------------------
>  .../devicetree/bindings/usb/ti,usb8041.yaml   |  5 +-
>  2 files changed, 4 insertions(+), 70 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/ti,usb8020b.yaml
> 

Applied, thanks!

