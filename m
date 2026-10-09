Received: from mail-yw1-f227.google.com (mail-yw1-f227.google.com [209.85.128.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A753CAA47
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 08:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791534192; cv=none; b=umC9GLn39EWDq8zBlcFYKpQCsyLW5BCLbPNViMycXb35O/zlImJG4xHLt2FP69RzPSpSvQvbLGf3fZU0uAKtxN02M47cOageVCAGtedHq68tqQ9I7kSpz59QT8qpOXQTdRBnuRAc+MjKlTyUDyeDeNZ1+3Dc9iG1g0Z2IK9wpf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791534192; c=relaxed/simple;
	bh=mHjuxP8No/svkLEibCC62pe0HCMEBgSlND5KAB66MxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PpC4qmAEqR/DelNYEjixsjeKV7qRo1/HvXLKcF41o/DAB+qRrLdKZrUlW3L7BxOgWPOHb73z5nUIXOL1fC/90IC/cRHDt8MCbdWhInlez/uv+5OwGmZsZvARhZ0tUqsKX+pTywC4KxKO4jgestrOc/SY8z8kzPYlXZ+D3BxJivM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=srcf.ucam.org; spf=pass smtp.mailfrom=cavan.codon.org.uk; arc=none smtp.client-ip=209.85.128.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=srcf.ucam.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cavan.codon.org.uk
Received: by mail-yw1-f227.google.com with SMTP id 00721157ae682-8ae8541a2f0so41165367b3.3
        for <linux-usb@vger.kernel.org>; Fri, 09 Oct 2026 01:23:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791534189; x=1792138989;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U8iFS6pM3tthaseRuGrSd+8pptlyySe0KSW3rDNx01Y=;
        b=KgawCnz3elHqHNpgjSMx7PVeDsz9tSOQxaBjCVgmxX+25I+KVDhF1yQ12ssdlknGkM
         dHXFCAxDBItg88wdz1JV6VsbwSA1yNrfXEAEzhzhk9vWSjG1OlV24rTuB4fFNRKZJrH4
         OFAyrVh5ff2DOynOEF4WpkZcgAbQcAQmwe70E8mRwgqaY2dxYvciXzqcS33bit4PLJE+
         uThIVUfkECEdqn1PR4syH8dI+18yjgu1Na0R/b21h6NFlomfxqjdI3gSGB88O5706DaA
         rKC2fXk4evt/8TD9iCQXOwVekksWL6lKssxV4DRH3qQHDDNEGEJZ4WQLz5GrcsLgbf+R
         h4IQ==
X-Forwarded-Encrypted: i=1; AKwUvBziws3zA7m4k/3i5jsF685KAw82AHlN6/bXhmiyRSOCBJJaIU1aELi/yY+g1/LQMw2qOd3ZBeOwHwE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/ud0ZxHVZa5TicV5xvAcB36P1YL+7J6EaqvD6fogyYYwl+CWK
	lGcZgCkzyuPkJCtjLItvFgsga+I5qylA6cc2/47gARjnBL8T+JUq1Hh2jacHHxC3X6E7S1ZQ3cE
	pEFXCQQMX5hw27TLUIravIWrMxI1/PMzxxs9hh3LACdYDYXJjCHHr
X-Gm-Gg: AYBFou0qbNfBqlgxEl0mnT1yox+LQto1svEmUxLcRt8tDK+53tGYPY2wYb+rfZleUFx
	32Ikt7OozPRCNvvrYpdrOcz4aCZsku90ESKjWIiHoUdMfJXGyn5PH1ETCXAmG1GZ2mgiaNcel+h
	uJX5MF5Bh/uq4jeyrHmfTCnakq8zLtK4Ts7bwn2IvibNMFtansfsyBSFNC7gCa6IuVm7pD4tZJm
	whXgswwmgv1twCcdWYS2J7/wkd3lLVQzm5E9BFqQkvZTJ0ZM29ftR/0WDnYC3AupFxzkNPQ7ula
	qdCe0fzIaTGMa4LnPI6xEIOTz9juSYLFcrxwepdA3leYAoW2jJfsDvJGz2T+r9IXAesN/4h2er2
	uPBI=
X-Received: by 2002:a05:690c:4142:b0:8ae:6740:99a with SMTP id 00721157ae682-8b07ed4e93amr3514097b3.30.1791534189243;
        Fri, 09 Oct 2026 01:23:09 -0700 (PDT)
Received: from cavan.codon.org.uk ([2607:f598:b99a:160:8a88:88ff:fe88:8788])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-8b07f329510sm59467b3.43.2026.10.09.01.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:23:09 -0700 (PDT)
X-Relaying-Domain: codon.org.uk
Received: by cavan.codon.org.uk (Postfix, from userid 1000)
	id 27EC31286282; Fri, 09 Oct 2026 01:23:08 -0700 (PDT)
Date: Fri, 9 Oct 2026 01:23:08 -0700
From: Matthew Garrett <mjg59@srcf.ucam.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Francisco =?iso-8859-1?Q?Beltr=E1n_Millal=E9n?= <fbeltranmillalen@gmail.com>,
	rafael@kernel.org, bhelgaas@google.com, linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org, lenb@kernel.org,
	linux-kernel@vger.kernel.org, Darrell Gum <d@rrell.co>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] ACPI: PCI: take native PME control on Apple machines
Message-ID: <asikbIuZUZsgmU52@srcf.ucam.org>
References: <20260924132859.24751-1-fbeltranmillalen@gmail.com>
 <20261008232912.GA940274@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261008232912.GA940274@bhelgaas>

On Thu, Oct 08, 2026 at 06:29:12PM -0500, Bjorn Helgaas wrote:
> [+cc Matthew (author of 7bc5a2bad0b8), Darrell, Andreas, Mika,
> Yehezkel, Lukas, linux-usb]
> 
> On Thu, Sep 24, 2026 at 10:28:59AM -0300, Francisco Beltrán Millalén wrote:
> > Since commit 7bc5a2bad0b8 ("ACPI: Support _OSI("Darwin") correctly")
> > negotiate_os_control() skips the _OSC handshake on Apple machines and
> > hardcodes the set of features the OS takes over, because those firmwares
> > return failure once _OSI("Darwin") has been acknowledged.  The hardcoded
> > set is ~OSC_PCI_EXPRESS_PME_CONTROL, i.e. everything except PME.  No
> > reason was given for leaving PME out.
> 
> It's clear there *was* a reason, but I don't know either.  Maybe
> Matthew will remember?

I /think/ this was the set of parameters that my machine would hand over 
via _OSC if we hadn't called _OSI("Darwin") - but it was over a decade 
ago so I can't promise that's the case. I think this probably needs to 
be tested on some older machines as well just to ensure there's no weird 
breakage as a result, but if PME is actually hooked up and there's no 
SMM managing it instead I think that's fine.
