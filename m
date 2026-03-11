Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153BB3C454B;
	Wed, 11 Mar 2026 15:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773243683; cv=none; b=Z+qaFxp3fIIymFkwJxzKp9hzJj9M8DiXNNtqkK5jQrGITYN99DLMqP+PphGiKxhvJK5pS5mw5VlNajINOhQzYUQ8JgJpDCnGyQxPNrLzjOr9KqpgcDazcKY6lUoeFw+DZmm61nEL0WWBncYrJFCyXBdjY/u1+Nobcv96BxzPm9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773243683; c=relaxed/simple;
	bh=Mo1+6KMz2Xzz8wYNrRHWW0+Uyyt+aZqJSr6q+c/bG9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IgTfPFmsG0m6laPOZ2MCb4aSNG0jF8UHcHuNZHltipCsP/cKzmezzwhwMNP5z7mlUQRhvpcyOu4h/UmNvJ8W1Uq8vZTswrHg8718dTxgLjlNi32l+BT0YfENkIpPxYsg9Du2xRsaHSEaXif9i4IXSBG0GfQQ869EjSso29+HDMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n8/rxvz+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n8/rxvz+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7BB0C4CEF7;
	Wed, 11 Mar 2026 15:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773243682;
	bh=Mo1+6KMz2Xzz8wYNrRHWW0+Uyyt+aZqJSr6q+c/bG9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n8/rxvz+0gLX5zk6OKXeSqCmZId9N1szhWTahItt9gxTEAKeTj+dD0QwY0AF6YRBi
	 MTCbiBoK0AUXDDIqLzBNkGvGlAJKgBqrAGWzVJaVXEsDTH/F2qUEl5Q/viBNcIa7rW
	 mVk0yyxRu28TacPZtIJSoocE3z8vLPlXj6aQzSpykEMcgjlSc2ajEmy50uQ6RQYi1a
	 BMvN8JkBPxx7zWVoUmPlhC1GhQetgJHsl+TOcVp97A7AXJ2lvq2/HijEcVh/ALO9MZ
	 ZIZ2JB+T6mWOblkmww13v2S5ivrjiEQ+/zFqn+gQ58Ce8ez235psza9y+4RD3T9+m7
	 7uG73asSkqkLA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w0LgW-000000008Ho-1jhz;
	Wed, 11 Mar 2026 16:41:20 +0100
Date: Wed, 11 Mar 2026 16:41:20 +0100
From: Johan Hovold <johan@kernel.org>
To: Fan Wu <12321260@zju.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Fan Wu <fanwu01@zju.edu.cn>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: opticon: fix UAF in write callback during
 port removal
Message-ID: <abGNIEsGtMZsYq6a@hovoldconsulting.com>
References: <aa_c0B9E7MPm_yqL@hovoldconsulting.com>
 <20260309142757.589802-1-fanwu01@zju.edu.cn>
 <20260310170424.19817-1-fanwu01@zju.edu.cn>
 <2026031137-amply-cardboard-581c@gregkh>
 <493E1779-94BC-49B3-80CB-3AE5FDD3D045@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <493E1779-94BC-49B3-80CB-3AE5FDD3D045@zju.edu.cn>

On Wed, Mar 11, 2026 at 10:26:33PM +0800, Fan Wu wrote:
> > On Mar 11, 2026, at 20:14, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> > On Tue, Mar 10, 2026 at 05:04:24PM +0000, Fan Wu wrote:
> >> On Tue, Mar 10, 2026 at 09:56:48 +0100, Johan Hovold wrote:

> >>> How was this potential issue found? Are you using some kind of LLM or
> >>> other tool?

> >> I'm currently researching static analysis techniques (CodeQL combined with LLM
> >> assistance) for detecting UAF bugs, particularly around cross-entry lifetimes.
> >> In this case, the analysis missed the subsystem-level guarantee that close runs
> >> before remove.
> > 
> > As is required, you always have to document this type of thing in the
> > changelog text.

> Thanks for the reminder. Understood — I'll make sure to explicitly document the 
> search method and tool assistance in the changelog for any future patches.

Here's a link to the guidelines if you haven't found them already (under
Documentation/ in the kernel tree):

	https://docs.kernel.org/process/researcher-guidelines.html

Johan
