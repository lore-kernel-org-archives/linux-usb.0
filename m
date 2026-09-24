Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6907F4A0EF3
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 15:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263853; cv=none; b=sjbDYnexXwdey8t7+9qBjNCQSWghFtXF+WaUXCAsR+92wv//czsh9R2atceSV2LY6efAtzGGpcCwmL6tIADkWknYoNmDkNsjSZjCgDoNfMPMfnbph9Z8v3QMgZVuXhDv+vJ0dnq5Fg/34jVXckCY2WyEIPWAokBzeiYNdvBGNvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263853; c=relaxed/simple;
	bh=Zv0yR6BbcReSaHov0VqNC9B/8SSZfpbix7YMNfapxko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZKOc9z3nHgXXbgXY1kdfxJ+JfAewWzAOaLBJaemsDtC5yzQYHzUG2NCul+OXsgYGvDTpEiayRE62HJWepCtloZwPwm1aVfhc143AZcd+wD6NeKP79lGSRJdk+KtsaRSaaQg75gEuHqK7SxRg5VlQnr0NXsQb2gasdj2nmRXMuhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=T0wPbh7d; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="T0wPbh7d"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66fb93aee5eso6882d50.1
        for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 08:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1790263849; x=1790868649; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iDrpvpL5sqLAVvdAjrAo2ss1QyRZ0bD4iQxldapowE0=;
        b=T0wPbh7d/Bx9PC95dGTd6rBz3qyg9tLmExyFAHpN7n0iC8qLrdvvYxYzVgb7hH5Dmb
         gRo12ueIRaB78jY7HuDbDrXHEqRvC2jkn4Ft2h1TvDFb/BLcEIQj9ply63Eniv+sYl2f
         FuyekpbwnRtg+7P7RG8SkTSZ7TaIkczgptk2GCcqVDEFmAU7qOjv6zJgOByjZzbuQQO1
         qi6YZaMEaAAPuz7xVtQ1PJwvNSyWHm2uuHbj2nbULcp5nys3PD64PPCaiyFSM5gttSOf
         p0eDaV99i4QpVED0C2CG04yNBdbfEAOK8KX2gFYnlNjgdLbeMVphvxpZwFPL148zfYWE
         Hjtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790263849; x=1790868649;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iDrpvpL5sqLAVvdAjrAo2ss1QyRZ0bD4iQxldapowE0=;
        b=HBIXRn9ZM8fj83kjfb0JK1ZvD+kLtwwxSggIsQGVnHmZhCDSmRBwDaNhBT8X0UOa9d
         lp4On5YRDgOPhpUItd1HKXWeaeu9HpKVMU/de1z3Z3MvAcyBw8pPk7u0tgXmGd2q2o2W
         VUxsmNo4UfCoVxW7d2oVSwrx+72V4FUlDDRfk1q85PWstnPYry097vJ4XsDRpG++FD4O
         XQgVY/mUyuNdYn+fWyj+lnhrWVpmD2SanrLWVn9NJKAw7N7ZLEfwm+VWJyY8Fh1IaCe7
         k1SAPMqPZEpQ+U2PE0+MrpF+IZSOBnJqrZYzVeYYAJQ+wks+86BX3vaIbeTScRLp//+i
         SlQw==
X-Forwarded-Encrypted: i=1; AKwUvBxHHAohpKl1kDKbVo/TrLFSubQLQZ70AGrSj34kk1BD6XUO80hOVWXpS1y8NcTLKM5YoGc6AzX0XAs=@vger.kernel.org
X-Gm-Message-State: AFuF++mxinPR7A7E0W3zmPR7hH72RYHVn6Yc6s3ZhumkUqNZHWKWvtvL
	U/SJqVYUH1S5l58k6CRdHrRhMUNca+UFXptRx6nxS4wXemmrvHDE9XCr+5ywjUoOsg==
X-Gm-Gg: AYBFou0mGhQdBmj3OR+MtlxaXKvoXwHnkeKIdrbY1RmQOcWb93EqKhv+nl9/S3fg4l1
	ELwU83ckL92zfvH0k4jZj1mHpNzV8rPBNMgAwSf8yF0epKzlwdVXvsZmf2NHjBakizj5JmWTGdg
	JpzQjRqV7h7IhOWPZ82CKCtE6jlMYQTzOLZA0xr1lsxRzN6Uos7GSy2g7hJS7khPWMEnNkqPk+B
	m/ukWVFAi3n8ndGpI+zE5/HkQUnfI9iwl5WbSW5bj7j/IoTggmDLsUpfMDGVGeYCTeJIbqR7zLX
	d6AQs9kns8ynkr80N2OumSJ89eOpyqGWSFajv3pjg/qhroEnv69t8/ih632LhJDyyWl41GujLlj
	F/W1Lk4to8CuWMubEZgauucluU+wOVox4n/N9sq1hqh+cf1P960eDqtZa4IngWMqPPGxBlyMtJb
	sGJ+iup3aJU0BQqWk5jMUpWW6k8cnuE7Qdi7dZgaCKc8BNBdEMYOGIn01o5g0UDJWkzwCHwzAkf
	DH8f7/p/uQR8fJptZVrwJ6elauCnTSNNT5cHSu7KkQ=
X-Received: by 2002:a05:690e:1188:b0:672:cf59:f2f9 with SMTP id 956f58d0204a3-672ed4db4f2mr1353663d50.101.1790263849097;
        Thu, 24 Sep 2026 08:30:49 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9141e21792bsm18821596d6.11.2026.09.24.08.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:30:48 -0700 (PDT)
Date: Thu, 24 Sep 2026 11:30:46 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Francisco =?iso-8859-1?Q?Beltr=E1n_Millal=E9n?= <fbeltranmillalen@gmail.com>
Cc: bhelgaas@google.com, linux-pci@vger.kernel.org,
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] usb: hcd-pci: Honour pci_save_state() failure
Message-ID: <cbd8331c-5049-4521-bba1-b57a892e4269@rowland.harvard.edu>
References: <20260924124221.12374-1-fbeltranmillalen@gmail.com>
 <20260924124221.12374-2-fbeltranmillalen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260924124221.12374-2-fbeltranmillalen@gmail.com>

On Thu, Sep 24, 2026 at 09:42:18AM -0300, Francisco Beltrán Millalén wrote:
> hcd_pci_suspend_noirq() calls pci_save_state() and ignores its return
> value, then goes on to call pci_prepare_to_sleep().  pci_save_state()
> can fail -- it already propagates failures from pci_save_pcie_state()
> and friends -- and when it does there is no saved state to restore
> later, so putting the device into a low-power state only makes matters
> worse: the subsequent transition fails too, and the PCI core then warns
> that the callback returned without saving the state.
> 
> Check the return value.  If the state could not be saved, leave the
> device alone and return success, so the rest of the system can still
> suspend.  Leaving the power state untouched also means the PCI core has
> nothing to complain about.
> 
> Signed-off-by: Francisco Beltrán Millalén <fbeltranmillalen@gmail.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

> diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c
> --- a/drivers/usb/core/hcd-pci.c
> +++ b/drivers/usb/core/hcd-pci.c
> @@ -541,7 +541,17 @@
>  	if (retval)
>  		return retval;
>  
> -	pci_save_state(pci_dev);
> +	/*
> +	 * If the controller is already inaccessible, there is no state to
> +	 * save and nothing to put into a low-power state.  Leaving the power
> +	 * state alone also keeps the PCI core from warning that this callback
> +	 * returned without saving the state.
> +	 */
> +	retval = pci_save_state(pci_dev);
> +	if (retval) {
> +		dev_dbg(dev, "--> not suspending, device inaccessible\n");
> +		return 0;
> +	}
>  
>  	/* If the root hub is dead rather than suspended, disallow remote
>  	 * wakeup.  usb_hc_died() should ensure that both hosts are marked as
> 
