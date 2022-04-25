Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CDC9C433EF
	for <linux-usb@archiver.kernel.org>; Mon, 25 Apr 2022 16:14:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243290AbiDYQR0 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 25 Apr 2022 12:17:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243287AbiDYQRX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Apr 2022 12:17:23 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id EACAE11D952
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 09:14:17 -0700 (PDT)
Received: (qmail 807105 invoked by uid 1000); 25 Apr 2022 12:14:17 -0400
Date:   Mon, 25 Apr 2022 12:14:17 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>
Subject: Re: [RFC v1] USB: core: add USBDEVFS_REVOKE ioctl
Message-ID: <YmbI2UB3HwAshj8Z@rowland.harvard.edu>
References: <20220425132315.924477-1-hadess@hadess.net>
 <YmarwaNQYn1GwFbQ@kroah.com>
 <e73035d1bae5d0c355166fb46f0f5f2f07752b3c.camel@hadess.net>
 <Yma3k3lRMIEFypMN@kroah.com>
 <1d82343a5987a308ac9bd3f6fd481bc12a608a24.camel@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d82343a5987a308ac9bd3f6fd481bc12a608a24.camel@hadess.net>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 25, 2022 at 05:17:28PM +0200, Bastien Nocera wrote:
> evdev, HID and USB revoke are 3 separate implementations that are
> necessary for common device accesses to be revocable.
> 
> The HID patch shows how device access is implemented in systemd, with
> the seat leader (usually the compositor) being able to request fds from
> logind if the user doesn't already have access.
> 
> logind would then be responsible for closing the USB devices the user
> doesn't have access to anymore when logging out, or switching user. It
> could either close fds it passed out, or use BPF to revoke opened HID
> and USB devices without needing to act as an intermediary.
> 
> In short:
> - libusb programme opens USB device, either directly, or after asking
> the compositor to pass a fd (and being authorised to do so)
> - programme does its thing
> - fast user switch to another user
> - logind revokes libusb access for the old user
> - new user can use the device without problems

What happens if there's another fast user switch back to the original 
user?  Won't the original user then expect the old usbfs fds to continue 
working?

Doesn't the whole idea of revoking file access permissions go against 
the Unix philosophy of checking access rights only once, when a file is 
opened, but not thereafter?  I'm sure I've seen lots of emails by Linus 
complaining when people try to use a different approach.

Alan Stern
