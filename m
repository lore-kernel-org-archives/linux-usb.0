Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDD72C0F6C;
	Fri, 27 Feb 2026 20:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772224028; cv=none; b=TVJXbgxu3mF6cQqe2uEA16jiH2kGziKXENxZ1bLFu5Ydk9bJqkSOotm9m+jtOj6FbTisZ3KNSdsW4n9eXQrrKeUFQzD5hDx5EuckKYT0GICVtRsJeggB5N2u7hBlIqsKgYUX1JSdAyp6FSOb1L49nGqcM6HDe17zBLsAoYWXYyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772224028; c=relaxed/simple;
	bh=9ivvF+P4qPQxosG1AG3XCVvk0TNZVWzeUjzsxxwWdYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N2sqZXlcSskT5xLVygaTnBF7tqPkyosSz5WN66OSlX5P4rRdI9wZBJzwWmDV4zgEezvWSqzlne/fh4PsGBnTWWP3VkzzXA2yIQldPg0Qe7gx7AXXKZhVWS9ZHZHtJ7v6paMd8j0loV9w0PnJkJn8Wr93nU5LKoRZPmYePPMk/Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FCQ10LlP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FCQ10LlP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5B67C116C6;
	Fri, 27 Feb 2026 20:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772224028;
	bh=9ivvF+P4qPQxosG1AG3XCVvk0TNZVWzeUjzsxxwWdYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FCQ10LlPbzxUpeEjILqptye5ZCWwTjmrmT1GWrY82WjMZXcXfpP2/JNMMzE9SMVKt
	 h/qihMalew9EtgT5c1QlIh0mCIBTUvCKxKXQMr28LRKhSm43+ILe7w0Ncq6n6gOTv4
	 OX2wio1aBkcaEsLPhBl1EjWB+g9g6ZIgtYD+zpHc=
Date: Fri, 27 Feb 2026 15:26:57 -0500
From: Greg KH <gregkh@linuxfoundation.org>
To: Venkata Swamy Kassa <venkatswamy7@gmail.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Venkata Swamy Kassa <venkata.swamy.kassa@hexagon.com>
Subject: Re: [PATCH 2/2] usb-typec-hd3ss3220-Add-sysfs-attribute-for-USB-role
Message-ID: <2026022739-reminder-theorize-cae9@gregkh>
References: <20260227185021.767948-1-venkata.swamy.kassa@hexagon.com>
 <20260227185021.767948-3-venkata.swamy.kassa@hexagon.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227185021.767948-3-venkata.swamy.kassa@hexagon.com>

On Fri, Feb 27, 2026 at 06:50:21PM +0000, Venkata Swamy Kassa wrote:
> Signed-off-by: Venkata Swamy Kassa <venkata.swamy.kassa@hexagon.com>
> ---
>  drivers/usb/typec/hd3ss3220.c | 207 +++++++++++++++++++++-------------
>  1 file changed, 128 insertions(+), 79 deletions(-)

I don't think you ment to send this as it's obviously not correct :(
