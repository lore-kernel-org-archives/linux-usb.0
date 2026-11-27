Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795764025;
	b=TRXArC5m92jgQ1qhdKgB56uJXAlxr/RUguK1TAmx9KFqIGl33RSmt10TgF7xzhxfiD+C
	 fY+QLNBUTlm4567mbfgUrCNBlmgpXaUeE2oMP28/tdEDkI3geu/pRhGQdCsjt7TwwEDNm
	 LlJB7lfQv4G93VAxvISCQjZdcL7F9V7nvelpincCyNaAZt3cnXhUlgUxmcc23UtJYm8Km
	 4PYKNYj+FSxAMKQiOfSehrCNa5xXjLKmrJ/PCMdFhYOPbRRqCu1jO71MrRfxC8NH8dbtF
	 5OADrVh06nZsPBE9TviHLvcf7N5kkBhiGi9JyCDwBAOLMUaT3FrZUWCVzk1Lo4WoITQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795764025;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=07xzgpg9PQ8Rzh2y903+NnbufDxQnKwfh2nGqYBaLNM=;
	b=V5jQYnL3O21uW2gGjtlM5DE+/MDT9wYCykQbKMAQjn55mvlLODGsv98nBcTQh7w+2pAI
	 fd7qA1u3EiDFrTSiHGKfGl0VqCXiMTTc6FUCGC1BAIpQzd9Lvf80ZltERih6YUIcfcHjo
	 AwldFm86eQZe6OZ14vNJk2ixICuTux+C4jFIz83Gi6LlCvpE+ekBl+FCC8aBJmeJCaAyR
	 Sy9V2okwW7II7all81kGizySowe6Dsn9KYcAvjKmcbyzRijMfPPzfiRkEzdALqCj37Zym
	 9iPPvTOc+mLWWQlF1I8SnUuYfQXxCBCH3SeydttW8pfv8OZphx1nYXBpppPsL51X3Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mhdg3SQj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F27E606A31C;
	Fri, 27 Nov 2026 07:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mhdg3SQj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FA351F000C1;
	Fri, 27 Nov 2026 07:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795764024;
	bh=07xzgpg9PQ8Rzh2y903+NnbufDxQnKwfh2nGqYBaLNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mhdg3SQj0UAoidL5B2tNefdRw+pv9R8e5N9Y6oAYADMoUYY6yxQ7gfSXN/97p8M68
	 Ew98PXm89qPBqmliUiO8OndeBllbbZuaphk+eqUyMDlwXv5j91lbXL4/IJIbam1XIF
	 EBz6auzIpKrC/HJRZDkwImsxCxJBbH+CuUjPweqz6DGxYGRAQHgpG2kitVIszA8jnA
	 oajay1Rl85lT8x+aQO0l3C0dUw6ftB76FMeZnhYCYHy1vVS7Tu06ojii50jt2IMzxd
	 N6vR459sU1AeswfzntKhS0ne09vkJCaExnyT8SDaQr0NloNP/2l7qCiwWWa9sK8u5b
	 N8h+3mFUDZqRA==
Received: from johan by xi.lan with local (Exim 4.100.2)
	(envelope-from <johan@kernel.org>)
	id 1xWqFq-00000001Pg8-07Y6;
	Fri, 27 Nov 2026 08:20:22 +0100
Date: Fri, 27 Nov 2026 08:20:22 +0100
From: Johan Hovold <johan@kernel.org>
To: Artem Novak <artem122novak@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: cypress_m8: remove trailing whitespace
Message-ID: <awkvNgFEHgBX9GhI@hovoldconsulting.com>
References: <20261126232159.68334-1-artem122novak@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261126232159.68334-1-artem122novak@gmail.com>

On Thu, Nov 26, 2026 at 05:21:59PM -0600, Artem Novak wrote:
> Remove the trailing whitespace from the else statement in
> cypress_dtr_rts().

Don't run checkpatch.pl on code that's already in the tree.

The exception is when learning how to send patches by working against
drivers/staging.

Johan
