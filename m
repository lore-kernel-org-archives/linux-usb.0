Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADDA27A907
	for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2026 13:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345610; cv=none; b=JXmq93hUGfsFyh8dCeXD1yi2o7O7JDxNaCM3GmYWdzz8TQeXiQnFmAEiohGs5mzoK1mEt7In+wEF/6DCgOur/+p9BJK87R9jYDmO+hrjQP0S8pGhF0s2n48ZO2WnFUa0ZLCJUUKaW/lzURTChfgLuox+5LrDsX11Ozl4LcpneE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345610; c=relaxed/simple;
	bh=joPYbp0ZP02DybuDa2CY3O03ozNssWKlSYod55rT1yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SYN6KNsooTiP1WW3FhG9b4rUTzM9Q1ZWzWdxtLn4AUjMP73DFeU5+VfBRHTvsVX49rPf6jOAb4F1Xxixwc0a+S0wPDtaMzdLvC9FFwhT0D7Db9Y8PdfHGa5IukaWTh/TzGMgFdnjIxoTroKoxd1rZ/Eb+zgr6FnsY7/fD2nfsKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ny9BCBTx; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ny9BCBTx"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92e512a9a6bso128247685a.2
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2026 06:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1783345608; x=1783950408; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MLLNMmJfCjN+k7kJeesIpc1+87YvCV+RyOBXDpUSJNQ=;
        b=ny9BCBTxZVqeOn7UOLSMwYjmTp9GRXxzN95DzqprsyYH0k5Ru5V+B3FoDEif3Dwi/R
         vI6AH8ly6DdeqBU45VpqIIEwEhsa492yT+XLv3jwiCemi5bFmsqRwwTD1t5QdBhmSgBU
         8+zNzspfqi0JCAn+QHZYwZovZZxFWkvLCNAq5n0O/oYh7XXCUMhJH35ahIEqAXaB+yAe
         Z2/31tBY5bSqCy4pyZagoGQeTjWxqkVxFLe1rTkcTWBpZmKHcKZWJi+5yvxk3nptIgpP
         u1sovfaI1n3MmlZPPY1SkLZfc4VLD0ew/uNmlaT6dJzSe/z6pUJzTPSIIspnhwXaxITJ
         joCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783345608; x=1783950408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MLLNMmJfCjN+k7kJeesIpc1+87YvCV+RyOBXDpUSJNQ=;
        b=hsEcOkdE7YiDqW2WOOP8O1nOEgk0881nHskNSrldDaCM2RY797DxtprLDxQv5p30J4
         H06I0wkl8YnxsEg0an+KPEPZcVyLtE23q5nGKCDRM2K+7i65VUPhz82fQXnxIUi+c5z9
         4YfNxIi3JG4ZYPTqa6EencNduAXiGtDIhXuVurzvSlhrBkJ77wkvuZwXT20ZWc48Aobz
         Y4uFHBDFpEeRlZN2hyLr2r+R+DftLoXwCINthto+V1A5sU4DOiWu4b0WmjDDPBCpMhIQ
         YrQ0onv3Ev6dDp5PfMrTXP/ZNqyjDAkSKRIVocYinWZD1j5jKcNA0vFmA5GdJB3ctCzm
         OAjQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqb+QyVQYr8v8D3U18F8pq4D9WnSSo+oBuTzwSA8oOX2AS1pYK/2xkkwGrfLeijm2LwE4YAQt/jD+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVfkhafOoL6NYIgwl9hEZ+azH8tt9iGMMoE0bW/I8GunBIgN6J
	tn3j/rxJDyX+jWR2kQACa0MD4dLT7SmFJhvPOg/1WQsG7WhS64uL9CMy4KEryL6DbA==
X-Gm-Gg: AfdE7cnQfFHTnbWQ9vIxtGc9EvikAV5YypzgOKEue6SPsqH/+q4t6IRTzeeSJjSgDtS
	I9Ih9eV/0Ha1KeTiBvhVPyCzp2jKNlaQVFAwULKYIkADjRDTTAvEVFwaWlFr3+AC8d/3YkzqoeA
	rYdQIbeTKJsmWFSNIi1/WWV/ytMJVhH8B1Hqk0cjHGKfDRoYv0VBxmcuDdwZTijmR1RRNTflZbR
	BzpQnzIVC33aZssDU1LXzReumrS3vn7JLzzfjZ8rCvy+sx7s1G0chvjkJTS9ZRbIVqZcGnexEjr
	vkkQBz/D8gW9DAWVU+L7eML6oExlXpyiAM1Uzh70073a7/dMXNA44mvp+4mLoxTYznyqjnECw00
	p6Fwz9FVZyOedWCWPpxQ321bXo2dmw+M7sl11/dW3n+0K/pKAYqhkHVNmTjWIBrBQdwT8iqUoxq
	WzLHXAsQVOiYi+mw==
X-Received: by 2002:a05:620a:40d5:b0:915:8bf1:bb10 with SMTP id af79cd13be357-92ebb4c76e3mr86066985a.10.1783345607509;
        Mon, 06 Jul 2026 06:46:47 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::883a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90b804ccsm938566485a.10.2026.07.06.06.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:46:46 -0700 (PDT)
Date: Mon, 6 Jul 2026 09:46:43 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Oliver Neukum <oneukum@suse.com>, Mike Lothian <mike@fireburn.co.uk>,
	rust-for-linux@vger.kernel.org, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Alexandre Courbot <acourbot@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 10/11] rust: usb: keep usb::Device private and
 gate transfers on Interface<Bound>
Message-ID: <24196da3-62e8-4707-8024-d989bcd5d3a8@rowland.harvard.edu>
References: <20260617145946.1894-1-mike@fireburn.co.uk>
 <20260703030020.2694-1-mike@fireburn.co.uk>
 <20260703030020.2694-11-mike@fireburn.co.uk>
 <fddbeaed-ff21-4962-b09f-d975c96cd926@suse.com>
 <DJRF98V7SMXT.14BS8WGBEESZ8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJRF98V7SMXT.14BS8WGBEESZ8@kernel.org>

On Mon, Jul 06, 2026 at 12:38:40PM +0200, Danilo Krummrich wrote:
> AFAIK, it is not necessarily valid to assume that if an interface is bound to an
> interface driver, the parent USB device is also bound to a USB device driver
> (which is what usb::Device<Bound> represents).

If we're talking about the same thing, then yes -- this is a valid 
assumption.  If a USB device isn't bound to a driver then it can't be 
configured, and a device in the unconfigured state doesn't have any 
interfaces.

Alan Stern
