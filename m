Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A55DBC7EE23
	for <linux-usb@archiver.kernel.org>; Thu,  8 Jun 2023 00:44:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbjFHAoz (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 7 Jun 2023 20:44:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbjFHAoy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Jun 2023 20:44:54 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id C9CFE268E
        for <linux-usb@vger.kernel.org>; Wed,  7 Jun 2023 17:44:51 -0700 (PDT)
Received: (qmail 245083 invoked by uid 1000); 7 Jun 2023 20:44:50 -0400
Date:   Wed, 7 Jun 2023 20:44:50 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     David Disseldorp <ddiss@suse.de>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] usb: gadget: f_mass_storage: remove unnecessary open
 check
Message-ID: <56023025-8b1a-4d1d-b080-4d2380c3fa85@rowland.harvard.edu>
References: <20230607215401.22563-1-ddiss@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230607215401.22563-1-ddiss@suse.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 07, 2023 at 11:54:02PM +0200, David Disseldorp wrote:
> The fsg_lun_is_open() test can be eliminated and the code merged with
> the preceding conditional, because the LUN won't be open if
> cfg->filename wasn't set. Similarly, the error_lun label will never be
> reached with an open lun (non-null filp) so remove the unnecessary
> fsg_lun_close() call.
> 
> Signed-off-by: David Disseldorp <ddiss@suse.de>
> ---
> Changes since v1:
> - reword commit message, following Alan Stern's suggestions
> 
>  drivers/usb/gadget/function/f_mass_storage.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
> index 3a30feb47073f..da07e45ae6df5 100644
> --- a/drivers/usb/gadget/function/f_mass_storage.c
> +++ b/drivers/usb/gadget/function/f_mass_storage.c
> @@ -2857,7 +2857,7 @@ int fsg_common_create_lun(struct fsg_common *common, struct fsg_lun_config *cfg,
>  			  const char **name_pfx)
>  {
>  	struct fsg_lun *lun;
> -	char *pathbuf, *p;
> +	char *pathbuf = NULL, *p = "(no medium)";
>  	int rc = -ENOMEM;
>  
>  	if (id >= ARRAY_SIZE(common->luns))
> @@ -2907,12 +2907,9 @@ int fsg_common_create_lun(struct fsg_common *common, struct fsg_lun_config *cfg,
>  		rc = fsg_lun_open(lun, cfg->filename);
>  		if (rc)
>  			goto error_lun;
> -	}
>  
> -	pathbuf = kmalloc(PATH_MAX, GFP_KERNEL);
> -	p = "(no medium)";
> -	if (fsg_lun_is_open(lun)) {
>  		p = "(error)";
> +		pathbuf = kmalloc(PATH_MAX, GFP_KERNEL);
>  		if (pathbuf) {
>  			p = file_path(lun->filp, pathbuf, PATH_MAX);
>  			if (IS_ERR(p))
> @@ -2931,7 +2928,6 @@ int fsg_common_create_lun(struct fsg_common *common, struct fsg_lun_config *cfg,
>  error_lun:
>  	if (device_is_registered(&lun->dev))
>  		device_unregister(&lun->dev);
> -	fsg_lun_close(lun);
>  	common->luns[id] = NULL;
>  error_sysfs:
>  	kfree(lun);

Okay, now I see what's going on.  Thanks for making this change.

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern
