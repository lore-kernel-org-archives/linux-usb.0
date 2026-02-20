Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD961237707
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 06:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771567791; cv=none; b=QYdOtlg3Ct8oBNyeJpNYS7iyNsYXzEwRXaB8y8dMA0MvObX4w/S9JEWgh2jE7qWYw8CbzvUFldwww3Y9uE+PEeFvaSDuj7FL7euc6dEzkEyOytWewmZ9oXkv7h9FCTwmg6Wet8D3qp8ZHjfniWkg1vosnDV5uYmXKmvPODl+lAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771567791; c=relaxed/simple;
	bh=02ldnRAs5IrlSKH5eCJK9iiEuFvpHx9evK1GLRZkf20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mlNlb72PYv/hTlEZtHkjzubDBZWGZk5U3lPD+NDKzzxDPBXaNOY4Xwz3Dzikz2DF4fY7BUX/8XNWH2/gURMLtrNjJEJmUVKY3sNJoukV10FziRVsXvBcBD3tjnbu0Sjy1d+h/jhancKG/sQtlkf3SkA9PB0NsConcREu9vXTg6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oxRo2y3N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oxRo2y3N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23685C116D0;
	Fri, 20 Feb 2026 06:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771567791;
	bh=02ldnRAs5IrlSKH5eCJK9iiEuFvpHx9evK1GLRZkf20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oxRo2y3NtFXWe+ewVaE3pVtyWcZ6PoeVyJqzduoSiBxmONRADdKJz5Dg0m+/QAP6/
	 bbMLj82BGgH7kDAWLof+o61KSSN0mc6bK3SXWZsUgfRfZn8b4KpDLesQSMoBs0Wi0Z
	 noMDTUuD9WgLrlO227hPszMe06IRs4b92Zj65I/8=
Date: Fri, 20 Feb 2026 07:09:48 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Nathan Rebello <nathan.c.rebello@gmail.com>
Cc: linux-usb@vger.kernel.org, heikki.krogerus@linux.intel.com
Subject: Re: [PATCH 1/2] usb: typec: ucsi: validate connector number in
 ucsi_connector_change()
Message-ID: <2026022023-shakable-squatting-8747@gregkh>
References: <20260219164925.3249-1-nathan.c.rebello@gmail.com>
 <20260219164925.3249-2-nathan.c.rebello@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219164925.3249-2-nathan.c.rebello@gmail.com>

On Thu, Feb 19, 2026 at 11:49:23AM -0500, Nathan Rebello wrote:
> ucsi_connector_change() uses the connector number from the CCI as an
> index into the connector array without first verifying it falls within
> the valid range. The connector number is extracted from the CCI register
> via UCSI_CCI_CONNECTOR(), which returns a 7-bit value (1-127), but the
> connector array is typically only 2-4 entries.
> 
> A malicious or malfunctioning device could report an out-of-range
> connector number, causing an out-of-bounds array access.

Is this before, or after, the device has been bound to the driver?

thanks,

greg k-h
