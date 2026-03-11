Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA103B2FCF;
	Wed, 11 Mar 2026 14:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773240571; cv=none; b=WCPMAvJ/ieckJAwLCeoz8rSoIsZbIWWzyPgBmsOSz78B52r19N/V3b6/PVV6dT41TRxyNKKnDCRwtLPTfhzHQfxSxcHobH9AaELjO/FJNOdRwMd9abKj9tEJPbKXmNZeOEQcL56T/AA8SgzIEgiC0LtPJBWL35SEE08Lf02Y1zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773240571; c=relaxed/simple;
	bh=wmdkYPZH0L/y/JogiBGqQ8i9AKkAFTw87RE2yvoHRmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oeM37C6tvtmnfTLXkVKUgRmvSIEIFmSrAMciFdBOQnBaFETZ8nEC3oJcZLU+C07zSHmL4YZwf6anultExpc2KAZ/xaKC5watiapyw+9erpCNkXqnYwOdb/j7KPUO31iRRbVeMowmNWWoT1Ec4C/C159W2Wcp5bpGzLfwYDE67Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ejJg9xGc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ejJg9xGc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DBEFC19424;
	Wed, 11 Mar 2026 14:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773240570;
	bh=wmdkYPZH0L/y/JogiBGqQ8i9AKkAFTw87RE2yvoHRmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ejJg9xGcf89t46myEqva4XkMQMIRyl63ye8ABG1cODca8GJZEardCZh2BMXni9GJP
	 U7/lTCg2eFj9xV4Yn4vOdlDyZFQyobfE3kArPLs+f2hCV0aAERksyUq3ODl+xgoqZ7
	 ubMhSNE7aeFheMwk+OV357mglGZPYj0SP3IFwvug=
Date: Wed, 11 Mar 2026 15:49:24 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Cc: krzysztof.kozlowski@oss.qualcomm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, davidm@egauge.net,
	~lkcamp/patches@lists.sr.ht, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2] dt-bindings: usb: maxim,max3421: convert to DT
 schema
Message-ID: <2026031112-doodle-sedan-9c9b@gregkh>
References: <20260225014751.9121-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225014751.9121-1-rodrigo.gobbi.7@gmail.com>

On Tue, Feb 24, 2026 at 10:23:20PM -0300, Rodrigo Gobbi wrote:
> Convert legacy maxim,max3421.txt to proper format.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
> ---
> Just resending this from last year [1] since it might not be on Greg's
> inbox anymore. Same as v2, just with review tag.
> Tks and regards.

Thanks, I had missed this, now applied.

greg k-h
