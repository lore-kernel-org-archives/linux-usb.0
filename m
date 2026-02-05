Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB2C35D61B;
	Thu,  5 Feb 2026 07:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770277412; cv=none; b=qEqaxEVgwJDcHCoTKL/WZJlYeWa0gd08vjrQGcr4xie1o815YzPxtr8fKsVFrVzKCPaGFlrHL8K/lqy5093oN9P32/d+5D6VDMaCmtTI5zS7qDQ5UAaMb2ZujG74c92t+91KImEb7EYMk2VTWUANfeHx6KITANI8vOacZVLeDDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770277412; c=relaxed/simple;
	bh=jmTc98Ww6U1WEm7DhnUsuqNavBGcbSITF8l+RkaMFwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l/zYkwltMvWCB7qq5AuUQG5ZyXZAuu/IPfsAcPiE8eRkZKdTTzdapxM/P+2yfDt3wSGbjd/OmhkVew37lsjxbY7zDuQNyLfMf6xOMxsKXmPBCX1O8VESe5t60zqAs9olbapUf2rCi5Wg4t+ylqMwdM7XH5Tjgr4q6IZiKJQDnqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qLSgS7EP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qLSgS7EP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE149C4CEF7;
	Thu,  5 Feb 2026 07:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770277412;
	bh=jmTc98Ww6U1WEm7DhnUsuqNavBGcbSITF8l+RkaMFwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qLSgS7EPfTvG1eNEc7J6aAsEz6Vmpw9HfoOjR3CBdepqtQ/Nm7EZPhBlCwpMIEW9g
	 AhAVANKd96p5nFOyHDi/MAttnDkt14a+jEx5glzJpwm/wLhW7PbcBBhJ4S/IGOyDqp
	 a2PCufX428/KIBfSfNlCgS9zJUxK+wwjOiTzb3EY=
Date: Thu, 5 Feb 2026 08:43:29 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Vladimir Moravcevic <vmoravcevic@axiado.com>
Cc: Krutik Shah <krutikshah@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH 3/3] MAINTAINERS: Add entries for the Axiado USB UDC
Message-ID: <2026020550-uncle-bullfight-e15b@gregkh>
References: <20260202-axiado-ax3000-usb-device-controller-v1-0-45ce0a8b014f@axiado.com>
 <20260202-axiado-ax3000-usb-device-controller-v1-3-45ce0a8b014f@axiado.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202-axiado-ax3000-usb-device-controller-v1-3-45ce0a8b014f@axiado.com>

On Mon, Feb 02, 2026 at 05:16:30AM -0800, Vladimir Moravcevic wrote:
> Add the MAINTAINERS entries for the Axiado USB Device Controller.
> 
> Co-developed-by: Krutik Shah <krutikshah@axiado.com>
> Signed-off-by: Krutik Shah <krutikshah@axiado.com>
> Co-developed-by: Prasad Bolisetty <pbolisetty@axiado.com>
> Signed-off-by: Prasad Bolisetty <pbolisetty@axiado.com>
> Signed-off-by: Vladimir Moravcevic <vmoravcevic@axiado.com>
> ---
>  MAINTAINERS | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 67db88b04537..e63b6b308a3f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4234,6 +4234,16 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/sound/axentia,*
>  F:	sound/soc/atmel/tse850-pcm5142.c
>  
> +AXIADO USB UDC DRIVER
> +M:	Krutik Shah <krutikshah@axiado.com>
> +M:	Prasad Bolisetty <pbolisetty@axiado.com>
> +M:	Vladimir Moravcevic <vmoravcevic@axiado.com>
> +L:	linux-usb@vger.kernel.org
> +S:	Maintained

So you all are not paid to look after this?  That feels like an odd
business decision of your company, but thanks for documenting it
properly :(

greg k-h
