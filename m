Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE1D1FDE09;
	Fri, 17 Jan 2025 11:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737112173; cv=none; b=LYfnuXzmFJQOCoEYD8bxqmW+SB7l7w7Pv8qRNIyJcqSEVf9oukHpPDRir6/Q37QjEAjpdPcwNLMEh94er1BF0DU+HxXxb1HFpm9rjjncBDdDzwm1qndAP6GwB/zNW97kYXy2zRYZ/MwiKcvt2yLeqVSwB5Df3QAdeapXDmO01dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737112173; c=relaxed/simple;
	bh=qbwimB/A4jM6OjaRs+4TxywhDT7e2CFv5nGMchfEzhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kkiHjWn735L8RsQJ9QPK4MmzOP3mH0ST1X5PMDxiwTC2Ue1h1EifVP/SId/JFK4nOzCoOISTZfoWgVGO6osORDu8DDeSVRCRbAsnwS0Wb9qDzu9CISkTJzJMTdIIPoBQO+x8qhMoSvLN1B2IblL6/odjycIsJM8Xz+NOuI4UXOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0+8t3GRq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0+8t3GRq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB5BBC4CEDD;
	Fri, 17 Jan 2025 11:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737112172;
	bh=qbwimB/A4jM6OjaRs+4TxywhDT7e2CFv5nGMchfEzhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0+8t3GRqzOyEoCIGTWEy/KPS1uW+1XumVcxxfb3Hq2Lrh9MoeXWtKo/j64n1IoSkU
	 pCHfvI1SqvqvBS4ikwR2vgNS9G9yxFCMlHAGaDMDzAuUo4QUpKxd62jKZXo/Ifll5w
	 c/ejrPsHuKbNihI/4FJCb8LRCCpUuGhzwoPlS2V8=
Date: Fri, 17 Jan 2025 12:09:29 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: heikki.krogerus@linux.intel.com, peter.chen@kernel.org,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: chipidea: udc: initialize bounced_size to avoid
 coverity warning
Message-ID: <2025011707-sample-unifier-9204@gregkh>
References: <20250114102815.2311956-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114102815.2311956-1-xu.yang_2@nxp.com>

On Tue, Jan 14, 2025 at 06:28:15PM +0800, Xu Yang wrote:
> The synopsys covertiy tool complains "Using uninitialized value
> bounced_size." at some condition.
> 
>     sg_dma_len(sg) = min(sg_dma_len(sg), bounced_size);
>                                          ^~~~~~~~~~~~
> Although it can't happen, try remove the warning by initializing it.

No, we don't work around broken tools, fix the tool, don't abuse our
code for that, sorry.

greg k-h
