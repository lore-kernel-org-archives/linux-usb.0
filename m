Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E44F34C130;
	Wed,  8 Apr 2026 07:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775634041; cv=none; b=B3jE2ojI+o5kI2vHSLkmdkECa4wdCSdoggVqC8mH62GDC2XAKlMiUGP2GXw1nDFiL3mebjwTsodbHeX8C1UAODLU9WRKLEN8xi8z4jzAX7apzaBU1jx1tTSeROF6LQD8I0RoSQDXgiRItQb7DL1AFyr7cuYIKzeU0RjQS0JdWdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775634041; c=relaxed/simple;
	bh=6SYZt/lCG85IlbJV/NN01x1cg/EhC/PTzMct7PabP/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SNblKLghs/9ZpE7XDa6D4uxo2WODq3NKCoDV6GOuc7uytVWmM66YH4bR+bur6gz+yIYwm4VoPGSnu2I1pJp1gMXX8Id2Yf0JAriBPWLPW2CVRToihkZ0OGvOtGvQSXq2vGzGfW9mD3MpxLJ6HvMicaGfuCujIYIE0ZXL9hHVrg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U7pG7TKD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U7pG7TKD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5413C19424;
	Wed,  8 Apr 2026 07:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775634040;
	bh=6SYZt/lCG85IlbJV/NN01x1cg/EhC/PTzMct7PabP/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U7pG7TKD87s9ex6fYqlupUOgWhsh9u52LbP/s8dcDqlx0t6NxtHf0JL20p2bXhNTB
	 tiKbk6uRpGKkt+cX3NJIPXv6MPOHzHmZark96nQA9Bjsp3cGuh2w76TkNjWeDkZ4If
	 hyfAn+bv0E1wCbK7q7HDo4DorVnBgEhh9OGLqcAbik7eFDsppK2iFm+X0GuFMCqsIf
	 jrO3vKpSMMbkigouf8C5Mp5at+iRCjOxt8YWfUTzLQl9uqkIWI6W48zGJO5efTfCZy
	 IlRADRG0gO1Hb4ZLYQGS9txfZH4zqjF7JjIX4fCm4A9kdk2R8uZjgdQURgyaF+scOc
	 +ro8gX2dTeLIA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wANWg-000000001wu-1dTM;
	Wed, 08 Apr 2026 09:40:38 +0200
Date: Wed, 8 Apr 2026 09:40:38 +0200
From: Johan Hovold <johan@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: iuu_phoenix: fix iuutool author name
Message-ID: <adYGdvE7_UXIReWh@hovoldconsulting.com>
References: <20260407192342.1054359-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260407192342.1054359-3-thorsten.blum@linux.dev>

On Tue, Apr 07, 2026 at 09:23:43PM +0200, Thorsten Blum wrote:
> The original iuutool author is Juan Carlos Borrás - fix the spelling.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
> https://github.com/jcborras/iuutool/blob/master/AUTHORS

Applied, thanks.

Johan
