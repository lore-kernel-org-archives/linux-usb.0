Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C488633BBD1;
	Wed, 21 Jan 2026 16:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769012594; cv=none; b=KHIjtYTqLyXChemhpX8NiW98PpsB7NbbjG+2CrMrZDH0xtUBm+AwMAQoRVkipHPls09xt4ERL0SuFme1x8zWDoeJ6dbeC//pJjJ0etxoaRIE/97bogotvXucjGjPXBV4ied+fNwxBsHvnKJBYH5uh++JurrJxGhjRsfMxUGBvpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769012594; c=relaxed/simple;
	bh=C1zRnR4f/4ELo3Ee9QMbthpA+I4TkhRIPNNFP8kChbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lx/HQY1u5BGFiHarOPZ9p8gATlWFFA6NtrEjCkCTOIjyXdsVmEo1DktyFy4CE46E85F4FbjgvhbA7v+q1XHWx2k4554oBBKjPibISn2oA/0L2l40wXYD3GBu48TM4uKgmXmrnSaL2jj1PVfzthkbJbUqaJBgwiZqmC7LBopYyJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NdOIkDlu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NdOIkDlu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31057C4CEF1;
	Wed, 21 Jan 2026 16:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769012593;
	bh=C1zRnR4f/4ELo3Ee9QMbthpA+I4TkhRIPNNFP8kChbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NdOIkDluosG/WVQECA6YjymaU+ptEIKqOKt9//sH3+r+Iyb0juaaepfh/j2XFpVq2
	 u5cv3qjZcxi5g3TOp0E0qSopSkcVDMg0qT64IDHZARQ49n/kRlIDnZXS8KKUYNzA1g
	 TbOBiPFaZ29xo4gY+uYuQg91THPTXambdO4R0CXeQBSec+dNA4phOSjO67asydG1tc
	 b3THq7cMXXtOAEwkszvdxIgRAnyLNJNuj8A/jOWMylLiE3hR/dsdkp3GT90wxv2Hro
	 qL43iEbgl6llwsEa2rn9Mue0eyuLm0wvFZ5+h8cNcxYw+i02xSHFl8tzdKfIXzKIBC
	 DEyMliklyv2fw==
Date: Wed, 21 Jan 2026 10:23:12 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, Xin Ji <xji@analogixsemi.com>,
	linux-usb@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: drm/bridge: anx7625: describe Type-C
 connector
Message-ID: <176901259157.3406253.14023079021907994492.robh@kernel.org>
References: <20260121-anx7625-typec-v2-0-d14f31256a17@oss.qualcomm.com>
 <20260121-anx7625-typec-v2-1-d14f31256a17@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121-anx7625-typec-v2-1-d14f31256a17@oss.qualcomm.com>


On Wed, 21 Jan 2026 12:15:45 +0200, Dmitry Baryshkov wrote:
> ANX7625 can be used to mux converted video stream with the USB signals
> on a Type-C connector. Describe the optional connector subnode, make it
> exclusive with the AUX bus and port@1 as it is impossible to have both
> eDP panel and USB-C connector.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../bindings/display/bridge/analogix,anx7625.yaml  | 98 +++++++++++++++++++++-
>  1 file changed, 97 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

