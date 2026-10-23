Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792764037;
	b=Wgt/Sddw1juvajw3DbiUJJifwJ/MF3Au4LUUFp8tiPsHF/SqP4q4HMyZv22bOZFYx0NA
	 s4TR7CUKiLC9h5rk1fkizEjt2+v83LGTrmQtQFodhFjK6PNFq0/jBsvOBvPqPVcg6PCor
	 GAgj4j3TgzlLwZcHWSommAg+4zMKQV9kHb9iunIKA3hrlIJqUedEMjbW0tr6T9hHU8t6O
	 lNaaVcrLKicGkW7jj9krCeAkZ7/gwBhRpS+4gchDkHHumIbwkCRoPY+8TmZ8jGscbDgfn
	 90rz7ln9cDxV4BKzJNJxVEecP+N73m4XLwhcrn3qICtCdbwu0WjDPTSJ0f09gW3Ou8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792764037;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ZKpRjW7HiyN1IJt30Cg+r6Yn5qpZyIt8rCJMGd3LlBI=;
	b=LAVitVHUWmFWr38LqpL6Y4MFkw+42bwCfaDhBXGHwLBqBlBm53bALa+dNkmJUqdJju6O
	 mgk6p08avlA7e4tTEHEYoFnq8rQSHvyyZVpNcQP5o7QNHoY7HWg7CN9qcsa4lAmsWnS/Z
	 baZSDoucLn/glOLrbhQO3VtfyVP3g4EyYgjQcSEv5SERoVW6K7SXry3rKllsTjT6eZ0N0
	 DKr+INGJB/jArJhamb71UKcCdRMU/tqm34mrSV9X41Ui+TnGDulGfpsJoSggygPnos6ky
	 gE9GbE5PwGmw5OjmV56mMfFXuiWaZKRpuDsoEwrhaifUNt2q9gRtarti5gMPN3Tb3ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FK2yvE4L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA12606A31A;
	Fri, 23 Oct 2026 14:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FK2yvE4L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 426731F01825;
	Fri, 23 Oct 2026 14:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792764037;
	bh=ZKpRjW7HiyN1IJt30Cg+r6Yn5qpZyIt8rCJMGd3LlBI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FK2yvE4LIMk0p/ki96RObKgi0KWKy7jCKNOTteMgWLabPrHwbOOjUrIxfUhldf8Gk
	 4+i3FAMinXUjhXQZDByz701S5RzkBgusjSWhICNiX0t26ElolAXIuge+rgZ7MuzscU
	 y4CuW7GmRBQ41UoB8ZRU+U5aiULZRi6TnXM8QgLTQCML1g4ua51kY8mP43l7mj0Sai
	 xG15wSx4Ky7QHlG8QoNlK39vPVCAvn3NyCmSB6fq/34FP4S90guF4dP0XW3gUwqSBv
	 S3buE4zTXaR4SlDW0fSgA8jsuB3dGBstmWf4s6WbzpR07vPe/L4AqwaCrUmJjggACi
	 0uvWKBMosDb+w==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xKFox-00000000oBO-1VzW;
	Fri, 23 Oct 2026 16:00:35 +0200
Date: Fri, 23 Oct 2026 16:00:35 +0200
From: Johan Hovold <johan@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 10/12] USB: serial: io_edgeport: deassert DTR/RTS on
 close() and B0
Message-ID: <attogxJD5snTPf68@hovoldconsulting.com>
References: <20261023121530.186541-1-johan@kernel.org>
 <20261023121530.186541-11-johan@kernel.org>
 <sashiko-outbox-182789@kernel.org>
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
In-Reply-To: <sashiko-outbox-182789@kernel.org>

On Fri, Oct 23, 2026 at 12:43:07PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] USB: serial: io_edgeport: DTR/RTS dropped on reopen with HUPCL cleared

I'll fix this up when applying.

Johan
