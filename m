Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76CF36604B;
	Mon, 24 Aug 2026 10:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787568806; cv=none; b=hCICYMSh3Zh2lCIZt5XwCNi11+OcEKzqxn/FeQA9KKp8mzqdgI/0QG1k15Cv/DjkN130R0mG/jHBObCv9yPkaR3Y6eFFXjLtkq5sQ9iV67lG8hFYyLhfcKN+zRJELYjcYKfqKaM7wWk6pJsSJoyFPBNetuViMoFcUeqn1fVGWfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787568806; c=relaxed/simple;
	bh=rgZEtJ0YnxTjYHFbEDNwltcJemeI52wfhHpnKociBLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RwkWlIPJBD2DrBD2mCt60hCPoOuvBi6DgifdVVSxdiAl2oZxZF8os3BC0euw7vFrCO071pBCcw6hLNyuQKI6cSlYP2ZQd1wcrF4XIcNhk4nwdEix5pdCSd87hhKBzXOWb/OuHh7vS/g7zDT7Vu4ljk6VJU1C1B7GGPqhuxGPYjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jeZWWxOD; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jeZWWxOD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787568805; x=1819104805;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rgZEtJ0YnxTjYHFbEDNwltcJemeI52wfhHpnKociBLU=;
  b=jeZWWxODJyW+SPT/VZtofFCBLHxZkfWjJDy4j3thS8OVZHn+kDgDH+5I
   TiNRNTtqkA6Ocos5Yfp4aJlXQD9x1aAXds8q/1Rnzbbahz8PuetH3cEEH
   Qt5QS2suDjI+awC/fzbtf2tC19jJADxdvvztxv9tHBDc/iDA7SQeu7laI
   RrciBmz/HYzFX8j+TuWtynDzxwsSG42jMS88xO84GPIpqZ1hpmWwBx8xX
   PCw3LkDfZZJc9QpDZBf1g4YeYNCPNz0B8WBxg2bb0Eoq47dlG2DFq2mUb
   CaADNNKd4BTKBX1xxNSDGzadn8vKqeumrVHo1Bconsnp/eegwB0tmIEdx
   Q==;
X-CSE-ConnectionGUID: +x7hCaGSSEaHGinlIBbxKA==
X-CSE-MsgGUID: gDS2QQ+USI6UaalUBy97+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="91886742"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="91886742"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 03:53:25 -0700
X-CSE-ConnectionGUID: 0zBVVA+LSw2MnCiqV+t3ew==
X-CSE-MsgGUID: CPi9H4/jSeWfpIATQGPzAw==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 24 Aug 2026 03:53:22 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 5945999; Mon, 24 Aug 2026 12:53:21 +0200 (CEST)
Date: Mon, 24 Aug 2026 12:53:21 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Jameson Thies <jthies@google.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com, bleung@chromium.org,
	gregkh@linuxfoundation.org, akuchynski@chromium.org,
	abhishekpandit@chromium.org
Subject: Re: [PATCH v1] usb: typec: ucsi: allow retries of ucsi_resume_work
Message-ID: <aowioeLgI2NJKFf2@black.igk.intel.com>
References: <20260818205717.1492247-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818205717.1492247-1-jthies@google.com>

On Tue, Aug 18, 2026 at 08:57:17PM +0000, Jameson Thies wrote:
> On resume, the UCSI driver will re-enable notifications by sending
> SET_NOTIFICATION_ENABLE. The LPM/PPM may be busy during system
> resume causing SET_NOTIFICATION_ENABLE to fail and preventing the UCSI
> driver from receiving connection status changes.
> 
> Change resume work to a delayed workqueue to allow retries on failed
> SET_NOTIFICATION_ENABLED commands. Additionally, cancel resume work
> on suspend to prevent pending resume commands from impacting suspend.
> 
> Signed-off-by: Jameson Thies <jthies@google.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi.c | 18 +++++++++++++-----
>  drivers/usb/typec/ucsi/ucsi.h |  3 ++-
>  2 files changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index bef3f9b71d71..5c67f0990dd3 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -2158,7 +2158,7 @@ static int ucsi_init(struct ucsi *ucsi)
>  
>  static void ucsi_resume_work(struct work_struct *work)
>  {
> -	struct ucsi *ucsi = container_of(work, struct ucsi, resume_work);
> +	struct ucsi *ucsi = container_of(to_delayed_work(work), struct ucsi, resume_work);
>  	struct ucsi_connector *con;
>  	u64 command;
>  	int ret;
> @@ -2167,6 +2167,11 @@ static void ucsi_resume_work(struct work_struct *work)
>  	command = UCSI_SET_NOTIFICATION_ENABLE | ucsi->ntfy;
>  	ret = ucsi_send_command(ucsi, command, NULL, 0);
>  	if (ret < 0) {
> +		if (++ucsi->resume_retries < 5) {
> +			queue_delayed_work(system_long_wq, &ucsi->resume_work,
> +					   msecs_to_jiffies(500));
> +			return;
> +		}
>  		dev_err(ucsi->dev, "failed to re-enable notifications (%d)\n", ret);
>  		return;
>  	}
> @@ -2187,6 +2192,7 @@ int ucsi_suspend(struct ucsi *ucsi)
>  	 * EC is stopped for suspend; state is re-read on resume.
>  	 */
>  	cancel_delayed_work_sync(&ucsi->work);
> +	cancel_delayed_work_sync(&ucsi->resume_work);
>  
>  	if (!ucsi->connector)
>  		return 0;
> @@ -2200,8 +2206,10 @@ EXPORT_SYMBOL_GPL(ucsi_suspend);
>  
>  int ucsi_resume(struct ucsi *ucsi)
>  {
> -	if (ucsi->connector)
> -		queue_work(system_long_wq, &ucsi->resume_work);
> +	if (ucsi->connector) {
> +		ucsi->resume_retries = 0;
> +		queue_delayed_work(system_long_wq, &ucsi->resume_work, 0);
> +	}
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(ucsi_resume);
> @@ -2299,7 +2307,7 @@ struct ucsi *ucsi_create(struct device *dev, const struct ucsi_operations *ops)
>  	if (!ucsi)
>  		return ERR_PTR(-ENOMEM);
>  
> -	INIT_WORK(&ucsi->resume_work, ucsi_resume_work);
> +	INIT_DELAYED_WORK(&ucsi->resume_work, ucsi_resume_work);
>  	INIT_DELAYED_WORK(&ucsi->work, ucsi_init_work);
>  	mutex_init(&ucsi->ppm_lock);
>  	init_completion(&ucsi->complete);
> @@ -2365,7 +2373,7 @@ void ucsi_unregister(struct ucsi *ucsi)
>  
>  	/* Make sure that we are not in the middle of driver initialization */
>  	cancel_delayed_work_sync(&ucsi->work);
> -	cancel_work_sync(&ucsi->resume_work);
> +	cancel_delayed_work_sync(&ucsi->resume_work);
>  
>  	ucsi_debugfs_unregister(ucsi);
>  
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> index dc594388dcd0..1996f04ed5e6 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -484,7 +484,8 @@ struct ucsi {
>  	struct ucsi_connector *connector;
>  	struct ucsi_debugfs_entry *debugfs;
>  
> -	struct work_struct resume_work;
> +	struct delayed_work resume_work;
> +	int resume_retries;
>  	struct delayed_work work;
>  	int work_count;
>  #define UCSI_ROLE_SWITCH_RETRY_PER_HZ	10
> 
> base-commit: bdab5605259ba5d6ff927c1a85cc83eb3ecfdacc
> -- 
> 2.55.0.737.g08866a6d13-goog

-- 
heikki
