Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840663590C3;
	Fri, 26 Jun 2026 18:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782498266; cv=none; b=KMj8YCVYb4aNIxl8G13vlGPjZfwuPjgzs0cQWsSztWbO+o12z+dFYqMlPisL4XA8vCf4jBEXf2RZfQVF2GIQBLgDI1p12H3fJXOROAzr2d8IEqssMfIc5GT1Qs8++EsSUU5RaurdyGqy3uesTqlxpVURF47jqZxFQrWhx6szkQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782498266; c=relaxed/simple;
	bh=6ercaolyalJIu30pOpCOMp5VYsK1mv5glWPl5lJri64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uwmCCyFthhu0Q7SchWKgLAUGHV7AOzeY2TtOCrFuAzXTtefQcaq4pMf2mosjfo2YZijJhAKMEdIy7Mue1VdrHJNvbVu/jKXvuEZrnyKnsOAD1l6FHYJhOLDWWeuqlbrv8/TFFDe5FKcpRwgIWV+YrbS6I3PUYinBxp3eASgcaiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dnHu9XfG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dnHu9XfG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9011F1F000E9;
	Fri, 26 Jun 2026 18:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782498265;
	bh=qcx0PZ/1VG5F1N26FAny7GAlqMkWVJAg7esbGUqahuA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dnHu9XfGYGxSsP7ERAaBTvbiJzsNxjyffsCiqEaeGsp/JrrRGF5XZloWDb0uhH0tq
	 ziMjLi5jwUTf9DVY6IK0tI5sKwCoFH+TKDzWhcj4OghEk+qJi3Mm3RuyrcojIKzfCn
	 AsoHOM19FbzcztzoLLOUR2fbqWJYF3JMd8T6Nx7g=
Date: Fri, 26 Jun 2026 19:23:11 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Minas Harutyunyan <hminas@synopsys.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 12/17] usb: dwc2: Add include defining struct
 pci_device_id
Message-ID: <2026062603-doorstep-schnapps-42ec@gregkh>
References: <cover.1782490566.git.u.kleine-koenig@baylibre.com>
 <654248182ed13e226844f9c6c257475b08215386.1782490566.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <654248182ed13e226844f9c6c257475b08215386.1782490566.git.u.kleine-koenig@baylibre.com>

On Fri, Jun 26, 2026 at 08:00:31PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> Up to now <linux/acpi.h> includes <linux/mod_devicetable.h> that
> provides struct pci_device_id. However <linux/mod_devicetable.h> was
> split into per bus headers and <linux/acpi.h> will only include the acpi
> related one (and similar for other bus headers).
> 
> As struct pci_device_id is used in drivers/usb/dwc2/core.h, add an
> include to ensure it's defined also after the includes in <linux/acpi.h>
> are tightened.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
