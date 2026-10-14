Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0133531B04
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 14:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791989894; cv=none; b=L4Zk2+W0USiz3izNSOinS7EWJ5wY5CfMIW+g8luCNjxuaLghChh3nDzmMJVQ0BygH9wFVCJ0z1vYsbDdmYZ8e5/qCepEo2i0mVoQ1SpUv57/7MucxUPEKWvIjQBfQFrJFymDbKS54OuKbud4PQ9frLB/aGEovSkEtHtqsZj2VDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791989894; c=relaxed/simple;
	bh=favv20QUS4n0s36pVO9/Q4DOlqW+akAGcEKiNfXx8po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a2WX/uITee8mFUZ9akZyuTlwXK1BupZvNOEdEJe/pp9H1TZPh6L7cwMwDtEh1n9xJJKM6oigx0M8QRdGPcHrX4gTGLQoUGtPYTcKe232wBq8CyS1ry/yBLRCaKgULoIUdDbF2y0GgGZzDopBM8Hq84IFQATCPfSnibQPA4j2u/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=WgrZ5NiE; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="WgrZ5NiE"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-53381e53b80so52643581cf.1
        for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 07:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1791989892; x=1792594692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=end4sOICJSY4jXS2ggbo5B9Zltmh1/qgwCGH+E3RbsM=;
        b=WgrZ5NiEFnvIsZOzhqPsZLvAIKwmV0w6Mo8W0hgb4hHrVvvdZuWAlGX6Q308OI9U7G
         nPLZa3rcmAlBHfT8jcMk4H+qGVoqL5jFPwo+vNe8askOv0nx7mesUxGpSV08Npz5RmyT
         p/qYwSPiUAvs2AHKTs6rCOIoirzpI5YRRiI0BoVPs0+00muOw0mDj2fBL2rQ2SanWb3a
         gn+4lhQMdV3GO6dHtOh2BCtK8p5HxNk9vxnbsSLGbOkFhFT1SLA/H6VF0o7fzt1lc+Hv
         j/QaZVlBeH6GQgywKMiNUW7IELoht9RQZKBK/uL7cNpVbGVeUtITUIUt7XMHR6IV3hcB
         jyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791989892; x=1792594692;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=end4sOICJSY4jXS2ggbo5B9Zltmh1/qgwCGH+E3RbsM=;
        b=PmTQEO9OXelo0HxjFM/6bf7Qxa+aWWDaBZUBI6Ejl3jkbfOe51soNjj02y8YLXmFJP
         AcJzSE0JthtQb5lSWhMsbPBVaGZxK/8Xf8VSChg7HFOQgsUxaGQA+k1mzyNkRS3NGKmL
         uiQeI4LSZt8hU/ueJyBcO6rJ34bt9UMBxg8Mg3Gm7GbeQrwBXBFwR2avG/hmvgpA8Obo
         BZvD2B1OF0LSh/zyA1wmiqPd+U/K9CSiArxdyyyPBz8cxQqQaN7HdmWelsf7q3G92F5e
         ppmPM3oiMKmbCUlO0aRE37d79Qg+g+ZulviH18I6R/uVDIvOfoTjFjnDadiMUdiaoAzm
         a4tg==
X-Forwarded-Encrypted: i=1; AKwUvBxuG5bKL4gQc8m/CPqmeQJMSAlMMYmQ0wTx0NfbVJ0zzU9DErKYS8XAEHXat8mbzSqYbHhlY+onoM8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlZWV8FIMwPjioHyLrnv7xWlSgU18MD2wdC9NQUeRpnNcJfZ+I
	wp7wXaraQ1J/yun3jQRlZkIYs42rCEWBg30wTL5qEoNEtjPm9lt0fU1AXIbWedEEOA==
X-Gm-Gg: AYBFou2Fxzg3nHvVQgiKdJvS0D4Km3pYX7sQj1srKa2yBfwgN6Tu1LARCEl3qAAeypA
	RVLMr96CYw1E+imVgzQaYi0p+Opfwk8WCf8OqWiguz4RxmMgJwJ59UCGvOfJc6HpCNIOWw+s6AF
	rgZaCRN6LbD5puM037GAQXlennLry6g0UnU9UcQ8sgGBCEBExQVyQVGMEbPIz22XvBHy3YGRpZl
	9c98CDF5+lahjoAbVC3DzTgle2k3dXpwaUNLx1OoOZYMTQhULSNRR9rmPyIXDTVh2Hh8AJzc53P
	UZRusdvQSx1dEVc0Z+ByjY2z7rQo/k916gUQfK3rKgOZIRiIFgyaZWXqEzyZlICqGxeKg1Hjl51
	6j6AahQ4YeZ/i7Te1nou/HUTxkh3w+kvGZkru2mOy0884CkK0C6Y1/5YN5lpezNKSmOuCliOwNp
	ZIwg5XP7Kde64V2oDOoD4hbN7K6tBM+nb10Rb0TOOu9zZ5U0sDR33uMlnqV3QPZk5W9uJIKu9dQ
	gmYTEwRvIPBfRGPSA==
X-Received: by 2002:a05:622a:8ce:b0:530:e1b1:eaeb with SMTP id d75a77b69052e-5359fa73749mr239755861cf.21.1791989891598;
        Wed, 14 Oct 2026 07:58:11 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b6fbdcasm126177791cf.5.2026.10.14.07.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 07:58:11 -0700 (PDT)
Date: Wed, 14 Oct 2026 10:58:09 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Mario Peter <mario.peter@leica-geosystems.com>,
	driver-core@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] driver core: fix parent lock use-after-free on
 USB disconnect
Message-ID: <90cff929-d12b-4bfa-9b30-19319376289f@rowland.harvard.edu>
References: <20261014133109.1392265-1-johan@kernel.org>
 <20261014133109.1392265-2-johan@kernel.org>
 <DM4N7SKUMF98.32GW04E2EVM8I@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM4N7SKUMF98.32GW04E2EVM8I@kernel.org>

On Wed, Oct 14, 2026 at 04:49:31PM +0200, Danilo Krummrich wrote:
> On Wed Oct 14, 2026 at 3:31 PM CEST, Johan Hovold wrote:
> > + * @need_parent_lock:	When probing or removing a device of this type,
> > + *			driver core should lock the device's parent. Note that
> > + *			the device must hold a reference to its parent.
> 
> For the reasons described in [1], I object to making subsystems responsible for
> the parent reference needed by driver core's delayed accesses.  The driver core
> should acquire and release that reference internally.
> 
> [1] https://lore.kernel.org/driver-core/DM4N25JXKTQM.3K7TP9HM68KQ2@kernel.org/
When is the appropriate time to take the reference?  Since it is going 
to be dropped when the child device is released, the logical time to 
take it is when the child device is initialized.  But at that time, the 
caller may not have set the bus_type or device_type.

Taking the reference when the child is added would work.  But then how 
would the release routine know whether or not to drop the reference?  
Add an extra flag bit to keep track of this?

Alan Stern
