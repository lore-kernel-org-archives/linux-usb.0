Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF11743787A;
	Wed, 15 Jul 2026 17:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784135866; cv=none; b=WUcyh/pVA1PUq6Pqiz1OpUFRTmwxXqPEbTttw1Lid4GGk45PIOYM8pqDNmoIBbjuPSAxkMQqQf6ZyOKjsSEMz9EbDwrbT6hqDuTmnD3ejLPVapH79kz8iyFqN04Y5aSZo3yFU3ieytr1dQaRVPHQhfz9fRSBYBJeWiqhr57ExKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784135866; c=relaxed/simple;
	bh=rWJOweXznd+4hHZBRqWOwpbblZscxeiaZB9lezz/8u4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n9+x0v/5gh1sHCU2ENcONx9RPu3dH2v/+e9UMAB5hP+vGAoLzzuFDnJK0PzvXi0RXb884zT5bBiaq2LBE+/KRhlQryuXnVIRJRIaT3tLchnSPTI7TacxAUDTgnEnoxEnMSYVFh23JSl1al9PnU3FFJaEMwTpDkV8WlDdVlV+AgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=ajTuj9Tv; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="ajTuj9Tv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8BeWJ5+v3V7K8s4TLxUYvJ6cD8QfFgDTsKjRz0BJDz4=; b=ajTuj9TvdJ7GzB+nRWilf/CDsN
	Da4cqzwEtiVlVVKdwvYH3PE+H6S/pQk2p0+wG6OetaKzsxdlOTZ5grFs4+f0YIWmYGS6lfyk1BXEo
	kYK8ZuvTA5F2qpnPS5FzVIfwl7MKO5NCZr3hfUmWzZWbbKfSOxumIWVQy+1cwCyq96fI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wk3Ej-00COPd-GT; Wed, 15 Jul 2026 19:17:33 +0200
Date: Wed, 15 Jul 2026 19:17:33 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: mxuport: validate firmware header size
Message-ID: <7cd8b7b0-17bc-4470-ae92-0bf39904b7d1@lunn.ch>
References: <20260715084611.45995-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715084611.45995-1-pengpeng@iscas.ac.cn>

On Wed, Jul 15, 2026 at 04:46:11PM +0800, Pengpeng Hou wrote:
> mxuport_probe() reads version bytes at fixed offsets after
> request_firmware() succeeds. Firmware loading success does not prove that
> the blob contains the whole header.
> 
> Reject blobs that do not reach the highest version byte before
> dereferencing them.
> 
> Fixes: ee467a1f2066 ("USB: serial: add Moxa UPORT 12XX/14XX/16XX driver")

Does this bother people?

https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

I would suggest dropping the Fixes tag, unless you can point to
reports of this crashing.

> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
