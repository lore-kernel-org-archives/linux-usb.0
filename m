Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604E63C455F;
	Mon,  6 Jul 2026 06:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783320870; cv=none; b=Cjmx+P7rwABIukztN4oqEXj3j/KCKE2kah5iq3G2gGKjBGRNfsbM9816RYN/CUQ9xQYiC6tGniV9rMn8BtMydikOIoLfLSz1T+9Xjjbbm69tbeCUgsdbShRMZwKEDVuKg/1SgDhjyHL30NgXolRjzIhAFUJDWWieJu3X36uXlqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783320870; c=relaxed/simple;
	bh=RGuvgfcHBIeji9i++xUBCI1OTtQ+7C7jl6np//qGkHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kEhXtYPyxDD88Hcj/Xwh8306LJ9JX6dk+HNjeDl2QnUMXJL05QswGnA7Dag/EV5hBNfD0ZzC+JqtKZXwLHdyxa+Omp9V9tBSZQbGCij5Y+p6wV5W0h8Ug0DTqULqkkrbkTlGVkTA0Yv+X5KnPcAk+HucabzR9wwfrqkw1v86f7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TapIVGqY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TapIVGqY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 458191F000E9;
	Mon,  6 Jul 2026 06:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783320856;
	bh=4gbZrWxca52Kz8Mady4m4JF6UM3wnz393E0Baw54Lf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TapIVGqYd5BQuhx/aYrsu41WRv8VVgdPfdBuxklkgbav3gL0Fi/vamJ+5SS0ZmWm6
	 DfsenCkHAVzBZDSTqNkVpN3Z/4+ZUQs5x5O3+L651S0cLNipT/O12YBXUp3/EcBUDl
	 GPYBGOkP5E8XAeRx7CFct9Tr/ngSmRmv4DkjPQlFInwCsvAyXa9DOU7HCajE356DS0
	 mw1qGbNSi9F79I6uHS3Z88419GT/FeM4edP0vr/1j4BFpfbQh9OEa0RXhhCHFpQ3Rh
	 lHTyMKI5Id7m0F1mOMpN4IDcxHcwvCFAVO1V/Qynl3pL3JXIw3ou9PD1qOSdTHZOVf
	 ZeVIa8toM7Mcg==
Date: Sun, 5 Jul 2026 23:54:14 -0700
From: Peter Chen <peter.chen@kernel.org>
To: Elson Serrao <elson.serrao@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 7/9] usb: misc: qcom_eud: fix virtual attach/detach
 event handling
Message-ID: <aktRFi8aQ0Pe6W1A@hu-petche-lv.qualcomm.com>
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
 <20260501170635.2641748-8-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501170635.2641748-8-elson.serrao@oss.qualcomm.com>

On 26-05-01 10:06:33, Elson Serrao wrote:
> EUD provides virtual USB attach/detach events to simulate cable
> plug/unplug while maintaining the physical debug connection. However,
> the current implementation incorrectly sets the USB role to HOST on
> virtual detach, which doesn't represent the disconnected state.
> 
> Fix the virtual detach handling by setting the USB role to NONE
> instead of HOST, correctly representing the disconnected state.
> 
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/misc/qcom_eud.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index 4734b6307a85..187cbffbab13 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c
> @@ -320,10 +320,26 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
>  
>  	path = chip->paths[chip->port_idx];
>  
> +	/*
> +	 * EUD virtual attach/detach event handling for low power debugging:
> +	 *
> +	 * When EUD is enabled in debug mode, the device remains physically
> +	 * connected to the PC throughout the debug session, keeping the USB
> +	 * controller active. This prevents testing of low power scenarios that
> +	 * require USB disconnection.
> +	 *
> +	 * EUD solves this by providing virtual USB attach/detach events while
> +	 * maintaining the physical connection. These events are triggered from
> +	 * the Host PC via the enumerated EUD control interface and delivered
> +	 * to the EUD driver as interrupts.
> +	 *
> +	 * These notifications are forwarded to the USB controller through role
> +	 * switch framework.
> +	 */
>  	if (chip->usb_attached)
>  		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_DEVICE);
>  	else
> -		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_HOST);
> +		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_NONE);
>  	if (ret)
>  		dev_err(chip->dev, "failed to set role switch\n");
>  
> -- 
> 2.34.1
> 
> 

-- 

Thanks,
Peter Chen
