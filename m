Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BAD29ACDB;
	Wed,  4 Mar 2026 14:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772635917; cv=none; b=Ohds8+TK4e9wk5sm2TDI824QP2oGC8rEMLm/VfF4VxhlkH+3RUJWU8eIpXS21QRaBLeSYe1vYeZHnIbFZIBwlxZHv0WcMEG0MyUKtkGlne7sayI/fQen+Z4eDFfZNsFbgkn0Y5kEDqNsqrh0jlYA8WLPWiuwNdS6Y3IDZlS9P7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772635917; c=relaxed/simple;
	bh=QHC2tAGxmxWw3VDJ9Th75w+1aKbI096hrieeiswOYlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mdQu3io4cS+lsAeXN1zFeFq0ozQlQxmHCTd4PDyqj74bq5XNW/N71JsRBOqI78QIRCASQziZ7gKhQgi16L9zNT/x+JtENmw/dMlwehhcKvUV9jTIRy6D4k8nd3Hi5cKV+wi19+a63B3Bjis3oVwHD1inqlRhVR9Lrtbcjtzq+RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=m81cN3oU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="m81cN3oU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BCEFC4CEF7;
	Wed,  4 Mar 2026 14:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772635917;
	bh=QHC2tAGxmxWw3VDJ9Th75w+1aKbI096hrieeiswOYlA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m81cN3oUmUwM6ecEeyWPyQ+K1jppAFTsneuqY8jVU3CW1AsTcUCH/6XQM6UWg5mF/
	 bltiIUbqFpnhOW3DBcKQdklcqg4sQyq/NsmLUbgTxWLcAjjScVtv4s5YxxtJsShCDO
	 kpijo9tw/eBxjn2UqOGtkQ95qPM5sKILmnt8GHQY=
Date: Wed, 4 Mar 2026 15:51:44 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: BaiKefan <baikefan@leap-io-kernel.com>
Cc: si.yanteng@linux.dev, seakeel@gmail.com, linux-usb@vger.kernel.org,
	alexs@kernel.org, dzm91@hust.edu.cn, corbet@lwn.net,
	linux-doc@vger.kernel.org, doubled@leap-io-kernel.com
Subject: Re: [PATCH v5 0/8] Add Chinese translation for USB subsystem
Message-ID: <2026030412-mystify-ride-9103@gregkh>
References: <cover.1765180570.git.baikefan@leap-io-kernel.com>
 <20260303194105.00004696@leap-io-kernel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260303194105.00004696@leap-io-kernel.com>

On Tue, Mar 03, 2026 at 07:41:05PM +0800, BaiKefan wrote:
> Hi Yanteng and Alexs, 
> 
> A few months ago, I submitted a patch for the Chinese translation of
> the USB documentation. 
> 
> Following your suggestion, I forwarded it to the USB subsystem
> maintainer for further review, but I haven’t received any response yet.

I do not see the forward to the USB subsystem maintainer, where did that
happen?

thanks,

greg k-h
