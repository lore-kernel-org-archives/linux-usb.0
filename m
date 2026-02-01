Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D7931AF30;
	Sun,  1 Feb 2026 10:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769942156; cv=none; b=ms8VR9wPcZuFURlRL8iEc68UtTPYA/XuTGYcDWXSEgygi6FEPFYZSMXgN/7j1d9uH3I+aDJIJkZNYVal4ttFbI6J3QCvmzYDC0VDiVT/k5469nr9/oKF493wI39fHjWd7htBbI/mTZFZ5aSJuchr+L6fhphmQ/Y6ZhNwWX1+hzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769942156; c=relaxed/simple;
	bh=ZCzC7L64wyzeBhQHmcn6Byq+LPOZvOUvAWCTmRrTQII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AnJIXs3/CsSVUO4Nf9bMpQ4p0GtSfgI80JABPDvCR4htedrUMI9UplDDEhAZhyrXVjaXk08GNSS6nQUw6/RrHEVrJw3VUatYztElqozIjcokwgLVtBaMmJvswgD8zNZcMDGl2KpKgqqRNkpHgAiYp0PVjuEIZavIu6q5uw3ojC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HaSXG/fK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HaSXG/fK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EA5CC4CEF7;
	Sun,  1 Feb 2026 10:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769942155;
	bh=ZCzC7L64wyzeBhQHmcn6Byq+LPOZvOUvAWCTmRrTQII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HaSXG/fKTsS+eXxLQV+/aKYChmFWNo6KKmFSCw7CviMRYAcY6lhiPvb4NFU54MutA
	 /E9gHOmx016HgcsNQBCvUAI3QWJyfDJI4rxfcUO1abX7MU9KF+t8BQMJuD9ER2VbF5
	 jZTbQbG2j8z+79Hxb4rQQA/ETX/uDs9uafrKyBkM=
Date: Sun, 1 Feb 2026 11:35:52 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Sam Day <me@samcday.com>,
	Christian Brauner <brauner@kernel.org>,
	Chen Ni <nichen@iscas.ac.cn>, Mateusz Guzik <mjguzik@gmail.com>,
	Liang Jie <liangjie@lixiang.com>,
	Ingo Rohloff <ingo.rohloff@lauterbach.com>,
	Owen Gu <guhuinan@xiaomi.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] usb: gadget: Use sysfs_emit instead of sprintf
Message-ID: <2026020125-slighted-fountain-7fe3@gregkh>
References: <20260131160111.3161630-1-krishna.kurapati@oss.qualcomm.com>
 <2026020129-given-grapple-d4ee@gregkh>
 <8ed37226-7f03-4d92-a43d-cd538944556a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ed37226-7f03-4d92-a43d-cd538944556a@oss.qualcomm.com>

On Sun, Feb 01, 2026 at 04:01:46PM +0530, Krishna Kurapati wrote:
> 
> 
> On 2/1/2026 12:58 PM, Greg Kroah-Hartman wrote:
> > On Sat, Jan 31, 2026 at 09:31:09PM +0530, Krishna Kurapati wrote:
> > > Use sysfs_emit() instead of sprintf() in configfs attribute show functions.
> > > sysfs_emit() is the recommended API for sysfs output as it provides buffer
> > > overflow protection and proper formatting.
> > 
> > But this isn't sysfs, as you say, it's configfs, so why switch?  If
> > there is no need, the churn is not required.
> > 
> 
> My bad. Its for configfs. I see sysfs_emit being used in configfs show
> functions in f_ncm/u_ether_configfs.h and hence tried to move to the same in
> f_fs and source sink.

You can use it, sure, but there's no need to convert existing code
unless there is a real reason it is required.  Just use it for new code
please.

thanks,

greg k-h
