Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DED442A150;
	Thu, 13 Aug 2026 09:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786614580; cv=none; b=GCuQ9UieoZtsg58tCqYWS9jYywbmdIu5W+Jz+YSs1/m2X4a3AJ+4o3IPd0yYaztpyAIBOm0KCTzUdPRAhJLdC5yzkEk0G7wY9nzZ/pwyOX2ZU19+gYXSNEsjv6RIo+mGH7uzFdkM47h6HtLGZCYtYY18vDZ+TZYTzNHYbCcKV/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786614580; c=relaxed/simple;
	bh=j/6VFLqMmWsYFcCRbi/+gA0E3dif0Xb6P0i3Mjv9F3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fr4TN/EdpmPRm7xPOo+twQrq7rHP2oyAo1TGYcZCgtmnKj4IWY76rptW1U/Y9ykd/Z05RRmf1qTM85aXWsJWk6KFrN59sQrWtjeOeQUWO3a9n9vVXJOWplnktlHdp2kju6tKb0fcozLnD+OhNomiMtVC5VNnt2EO5s1LicpDbSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BIwrsoCl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BIwrsoCl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 523CF1F000E9;
	Thu, 13 Aug 2026 09:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786614578;
	bh=TTABNkzRnvKcALm2Uzahbsigca8Jvi3+YV2m2C/7ack=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BIwrsoCl7tY9BhRCIm744CBabclvQfR64hEKjewDzXcajooO63rgrJfG5dth5CubV
	 OIdixsawiVZ++RlKe/uNmNNa1kjrVUwYT+haQHzm6bIb/8tLatLLQO4+AT+/EIzu3b
	 e8PaxrIgkBw7cbEXLu2YvjTqU99J2lG6vBQT7UIy5QkBdpKcAhjY93KuZG5FfdFfp9
	 j0yh9cdU/BMBhWwrTPdAND2ddmLNJO4J/sA59JdPAJdko4MmzjsA5jKZJVGYN0qG4Y
	 nTfS3IZKSMLNgbxJkCfndpCJHpkc3+pWfMssBe3YWrn+t9QieEOah1UAovhXnJ58zG
	 g84ay/MA0xIfA==
Date: Thu, 13 Aug 2026 02:49:37 -0700
From: Peter Chen <peter.chen@kernel.org>
To: Junzhong Pan <panjunzhong@linux.spacemit.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 3/6] usb: chipidea: usb2: add SpacemiT K1 support
Message-ID: <an2TMSqHTVh-XYdX@hu-petche-lv.qualcomm.com>
References: <20260812-b4-spacemit-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com>
 <20260812-b4-spacemit-k1-usb2-v1-3-f28cf29e522b@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812-b4-spacemit-k1-usb2-v1-3-f28cf29e522b@linux.spacemit.com>

On 26-08-12 17:26:14, Junzhong Pan wrote:
> Add a compatible for SpacemiT K1, and add platform data with correct
> flag since the hardware doesn't have internal otg register support.
> 
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/chipidea/ci_hdrc_usb2.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/ci_hdrc_usb2.c
> index 00d575cd2955..70c5ce750519 100644
> --- a/drivers/usb/chipidea/ci_hdrc_usb2.c
> +++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
> @@ -40,10 +40,18 @@ static const struct ci_hdrc_platform_data ci_zevio_pdata = {
>  	.flags		= CI_HDRC_REGS_SHARED | CI_HDRC_FORCE_FULLSPEED,
>  };
>  
> +static const struct ci_hdrc_platform_data ci_k1_pdata = {
> +	.capoffset	= DEF_CAPOFFSET,
> +	.flags		= CI_HDRC_DISABLE_STREAMING |
> +			  CI_HDRC_FORCE_VBUS_ACTIVE_ALWAYS |
> +			  CI_HDRC_DUAL_ROLE_NOT_OTG,
> +};
> +
>  static const struct of_device_id ci_hdrc_usb2_of_match[] = {
>  	{ .compatible = "chipidea,usb2" },
>  	{ .compatible = "xlnx,zynq-usb-2.20a", .data = &ci_zynq_pdata },
>  	{ .compatible = "lsi,zevio-usb", .data = &ci_zevio_pdata },
> +	{ .compatible = "spacemit,k1-usb2", .data = &ci_k1_pdata },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, ci_hdrc_usb2_of_match);
> 
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen
