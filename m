Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2AD2EAB8E;
	Thu, 19 Feb 2026 07:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771487658; cv=none; b=kVmwG5xloBg9YWcO8i/7XjGnTiHlww2WZ1YV38wGqIHXZ1f+np6101AeoTTUzVydztI8DZXJBR4aPT+9l8SgkhaKAtA8quzKjeVzGy00EQ2EGPNmk7GSOXC+iIsbyaTi+qI0LAf9wTlPHjV4mSjJcZn74bMEfmQEvyoxxKd9XQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771487658; c=relaxed/simple;
	bh=FoZgPXUOAuBhupyDq9rGtews6jB6sgqlXHk57oIZpfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kYEIMsEteCpY0bS1uaud0NYA2If1rWazYgqjTO2x7GD+k7PLX6QYO2UPiobcf4unwKP5ToCeshw3FyrTJSRN8GcWr2nBp6XvfhjpjKLfRazMR6Vumpn+KXQgr8zW/IxbOOvV2vbXI/pkqs88aKT5atlbZarr5v4xQoGvRB26o/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aM+KE8bg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aM+KE8bg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8439EC4CEF7;
	Thu, 19 Feb 2026 07:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771487658;
	bh=FoZgPXUOAuBhupyDq9rGtews6jB6sgqlXHk57oIZpfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aM+KE8bgM2aq6uvpx+DJo4HvicdLW5jibSD1PvVmJBg+ZInHN6HRnyq4Mv18JACPP
	 DwaIMMJc+GUqPpDAlas08A4/1U3NBVUOGa8MRndUlJGbLD8PTCPxdnon98056IZ4bC
	 r39zgqo7rK5K+aKRwb7+UfPybNV8Rrjc0wisLw1a54hDep08Wdb4dMlKZmLOLDPVdr
	 ECF2SFaCv2MSla9FU7MZ9y4AzIpf27kAb0b/MYF5stJoE8dmbgsLpRfJKsrNa3gJyk
	 9ys7qvDaEZCh+hF2cgX7/UXwQSo3I/tS3V+Bg9cjMjaR2snXlYPVNNut7zAgBhgWtb
	 h72ri4aCdsF2g==
Date: Thu, 19 Feb 2026 08:54:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yuanshen Cao <alex.caoys@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] usb: typec: tcpm: Add vid and chip info for Etek
 ET7304
Message-ID: <20260219-divergent-placid-dachshund-454afe@quoll>
References: <20260219-et7304-v2-0-b2e268494ae8@gmail.com>
 <20260219-et7304-v2-2-b2e268494ae8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260219-et7304-v2-2-b2e268494ae8@gmail.com>

On Thu, Feb 19, 2026 at 03:02:52AM +0000, Yuanshen Cao wrote:

>  static const struct i2c_device_id rt1711h_id[] = {
>  	{ "rt1711h", (kernel_ulong_t)&rt1711h },
>  	{ "rt1715", (kernel_ulong_t)&rt1715 },
> +	{ "et7304", (kernel_ulong_t)&et7304 },

Such tables are sorted by name to avoid conflicts. e < r

Best regards,
Krzysztof

