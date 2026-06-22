Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A96B35B645;
	Mon, 22 Jun 2026 08:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782118324; cv=none; b=nMhEY6jZ2p7P4bO97TA/R24x55S7Iw5r8vuM70uDQEQhICjoHy6KU0pITh3SR5hYxiLTvmmxHGm4IPnIOLd8K1DHpumyaqXZOU4kdaO9et97FXmucg49CBUfyn9aYqP+9CnyAgXLW29rfMuo0ms0mjRr0DFwQweJ5CiDtsrJoFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782118324; c=relaxed/simple;
	bh=7woHMGDcPx9MmwNqI0rL7Qw14n0SFGr1Xbl1YK0/zOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mK0Y8I9XYMJGb9v+cGTtcGsBD3Pt3ie6J6ko//IpFBLJ8QbWiC6ATWcvwGhFD1zhPyt1hZsqM/iJ66qqEGVDRhXL/HbAqavagCLBXbmvQzwcqYDsfTMdvchOZp+h/lp6k3qW1IK0ZIT1KPjL1OCuLSixJB5o4rVIt2QBqWi2alA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XHxCGYIS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XHxCGYIS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4880F1F000E9;
	Mon, 22 Jun 2026 08:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782118323;
	bh=4yWIfBHxWo9cEf/1oZrxIarf7W61YLpiiNRb/16ug4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XHxCGYISTqMQXCUZPeDWmjlVRVrLlSOZkVi7TNStQmz77VfXET7sttDvq31gWWVbq
	 JVhGrf8QgFCuetVHPfQE1H5FZ0b9FMySs0JY/jATB1OrKzlWHP/qfT82xe7UwPDEgq
	 YenleamvQojy3/e8qcf572djsYvL4XfoNezlG/+Q=
Date: Mon, 22 Jun 2026 10:52:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chinna Mopurigari Naveen Kumar Reddy <naveen.reddy@ftdichip.com>
Cc: Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arun Pappan <arun.pappan@ftdichip.com>
Subject: Re: [PATCH 1/6] USB: serial: ftdi_sio: add configurable inter-batch
 defer for read URBs
Message-ID: <2026062250-sassy-hamper-025b@gregkh>
References: <cover.1781744946.git.naveen.reddy@ftdichip.com>
 <eb7093a47b77e9ef3ab55ada4c9591ae472da645.1781744946.git.naveen.reddy@ftdichip.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb7093a47b77e9ef3ab55ada4c9591ae472da645.1781744946.git.naveen.reddy@ftdichip.com>

On Mon, Jun 22, 2026 at 03:38:34PM +0800, Chinna Mopurigari Naveen Kumar Reddy wrote:
> +		if (res) {
> +			dev_dbg(&port->dev, "%s - submit failed: %d\n",
> +				__func__, res);

Minor nit, dev_dbg() already has the __func__ information in it, never
duplicate it again as that's just waste.

thanks,

greg k-h
