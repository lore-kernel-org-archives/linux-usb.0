Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29B338E8B6;
	Fri, 22 May 2026 08:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779439070; cv=none; b=eellUMYa4ExxvvRbVlSmCJy8Xp+fPX7oKHX+qAcEEJUfPE9Jt0d5ZEtPeHRmvyY+NU7MKt3XihnSxc9NSBWOrFtdLQTxbQWJwHqWRcsp/VDDNYauIGuCrhGukGChNMv4dOwD5tlhz2dPocj4vfuuU7gfk3bJU/r2XrBTCUALVrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779439070; c=relaxed/simple;
	bh=kVz35aZEylnNs5OlfEo5fR9pBAo1VMzfgR5QsGR7Pzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l5A0gucSNtA7vsAx8tBVwgqUDf4/E+mkMkc/oLZwTlFXs2em0NFdCHtkbNIHdaeACZ9ACGp6eVEqX6P6D4DQVNu/XTWTBfSicDGrXmbvHaepZH1BioOoUjyLzLkux75t74BrG1W8nhgs7/5vyoNZ6pxqKB9ZN8t0lgU5H3ehTK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zL8wWgKa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zL8wWgKa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBEE81F000E9;
	Fri, 22 May 2026 08:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779439068;
	bh=UNIeFE4xVItxFsuEI5cJurUsTeVN2nIVVCal1/p6ljQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=zL8wWgKafMF1t1w3XVehC/voO3zANrGeOrHp6Tej/n9V7BPjzoZFiPfE0HNZYj/jG
	 qu2mzOKqpYCqUDia4PBI601eGdxLPDgxC2OApZHrPzZd3z3VR7q5t9k4vYAekK0uf+
	 lo0MsxWyjt8rb+4PUYeblWzl0bILamDU+OvqhKQw=
Date: Fri, 22 May 2026 10:37:51 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Michal Hocko <mhocko@suse.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [RFC PATCH v2] usb: typec: ucsi: Move long delayed work on
 system_dfl_long_wq
Message-ID: <2026052234-rejoicing-agreeably-0fc5@gregkh>
References: <20260508143853.330151-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260508143853.330151-1-marco.crivellari@suse.com>

On Fri, May 08, 2026 at 04:38:53PM +0200, Marco Crivellari wrote:
> Currently the code enqueue work items using {queue|mod}_delayed_work(),
> using system_long_wq. This workqueue should be used when long works are
> expected and it is a per-cpu workqueue.
> 
> The function(s) end up calling __queue_delayed_work(), which set a global
> timer that could fire anywhere, enqueuing the work where the timer fired.
> 
> Unbound works could benefit from scheduler task placement, to optimize
> performance and power consumption. Long work shouldn't stick to a single
> CPU.
> 
> Recently, a new unbound workqueue specific for long running work has
> been added:
> 
>     c116737e972e ("workqueue: Add system_dfl_long_wq for long unbound works")
> 
> Since the workqueue work doesn't rely on per-cpu variables, there is no
> obvious reason that justify the use of a per-cpu workqueue. So change
> system_long_wq with system_dfl_long_wq so that the work may benefit from
> scheduler task placement.
> 
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> ---
> Changes in v2:
> - Fixed a wrong change regarding system_long_wq used by queue_work() instead of queue_delayed_work()
> 
> Link to v1: https://lore.kernel.org/all/20260507142726.331206-1-marco.crivellari@suse.com/

What "comments" do you need resolved here before submitting this as a
real patch?

thanks,

greg k-h
