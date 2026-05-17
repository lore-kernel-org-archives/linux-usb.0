Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30A63B4EA5;
	Sun, 17 May 2026 14:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779027668; cv=none; b=Yh3YVnwz24WmKoSi2hIikRSzzR3XSbziylox7+sKjWnH6hWKrKN7d3H8xRQMcgfuiCxiw6I36bryq9MrQcle2+1Gh4Eux7KOeaQBkM7CrkNURvDE3YB3wvmJ0j5yYMs9T7nHCiNcMn5X5X8ufO/20Xi8wjUtjG8WVhKiczLsBas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779027668; c=relaxed/simple;
	bh=oqRuIKKvAbmniJu6GGfOc7x36kGLyzQ0kjsPEDpVaBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SuHlnTMM7m09JkuVOV5XycTerF7zoJrNd5IZXGqsAkQ6RJfxK3TKRoGNltzYNq4um3NEgjerUnV28Y6Tl4fDIZMF0Y4K3aDF0BOPPPagFjZrEo7Fy0gGsqmmBfE8xFCeE9PmuHffd4thx20hislSP3N51S3bgvD5BBC/zrSMBZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OMJFwlTQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OMJFwlTQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B340CC2BCB0;
	Sun, 17 May 2026 14:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1779027667;
	bh=oqRuIKKvAbmniJu6GGfOc7x36kGLyzQ0kjsPEDpVaBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OMJFwlTQzYuUBsbCWJJts/oXUhdym/cPjgxl6wEbtBsW9yRazf8SxZIiQBvyR/uAy
	 DLkOA0BuY6uSgFhkv6fx2OfYtD1em33KEwsxL7LnDxB4JUJaK3rp0c1HaNbdoMZRWO
	 mddNHDH0wcSfY0oJlaxF2I6QOmR1SprHwor47xyI=
Date: Sun, 17 May 2026 16:21:10 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Xie Maoyi <maoyi.xie@ntu.edu.sg>
Cc: "neal_liu@aspeedtech.com" <neal_liu@aspeedtech.com>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: usb: gadget: aspeed_udc: list iterator used after loop in
 ast_udc_ep_dequeue
Message-ID: <2026051752-passage-thinning-cc4d@gregkh>
References: <TYZPR01MB67588F1EEB07DBEB681AEE1ADC022@TYZPR01MB6758.apcprd01.prod.exchangelabs.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYZPR01MB67588F1EEB07DBEB681AEE1ADC022@TYZPR01MB6758.apcprd01.prod.exchangelabs.com>

On Sun, May 17, 2026 at 02:03:47PM +0000, Xie Maoyi wrote:
> CONFIDENTIALITY: This email is intended solely for the person(s) named and may be confidential and/or privileged. If you are not the intended recipient, please delete it, notify us and do not copy, use, or disclose its contents.

Now deleted.
