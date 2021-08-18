Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5927C432BE
	for <linux-usb@archiver.kernel.org>; Wed, 18 Aug 2021 14:33:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B35A0610E7
	for <linux-usb@archiver.kernel.org>; Wed, 18 Aug 2021 14:33:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239279AbhHROeT (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 18 Aug 2021 10:34:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:40406 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239431AbhHROeQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 18 Aug 2021 10:34:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B6319610A7;
        Wed, 18 Aug 2021 14:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629297221;
        bh=OF1J2wHd4VzDXAmG26skt+r/Iv8T+sRv9vvuG57iN6E=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=B6pwO5as/P1Nq+fBBC9DeW/1j44+QFTpGF3CkY5HVnb6ZxvhNwR4/cqBNeztwcEQN
         Glkt3Bq5uvxZZYA4Y9MvJ0vL7KeR74sTwNzKSwhfOgVtcQgSm97EcJ7J7ths+LnyV1
         TusydswoqB0/Dmv4zeieOHXwpRUY5kHQYKuwzMh4MlWGe3DNYZLA2ttZbv5RjK8aqV
         9k8BeMyKoRe2OLaHNfTuZkcVe31+myaCKmcz2l4K4w0x+9SFFtBqfai0fLSojDRH8y
         qaPZpqeJzqeQ6CH+Ba+XmS3+Qgvjv9HN8p11m7wH53JWKuXiVd7bP1Vo/qp7L/DYyw
         fnZzILs80TIVQ==
References: <87mtpegak8.fsf@kernel.org>
 <20210818141247.4794-1-lutovinova@ispras.ru>
User-agent: mu4e 1.6.3; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Nadezda Lutovinova <lutovinova@ispras.ru>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: mv_u3d: request_irq() after
 initializing UDC
Date:   Wed, 18 Aug 2021 17:33:16 +0300
In-reply-to: <20210818141247.4794-1-lutovinova@ispras.ru>
Message-ID: <87k0kig6v2.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Nadezda Lutovinova <lutovinova@ispras.ru> writes:

> If IRQ occurs between calling  request_irq() and  mv_u3d_eps_init(),
> then null pointer dereference occurs since u3d->eps[] wasn't
> initialized yet but used in mv_u3d_nuke().
>
> The patch puts registration of the interrupt handler after
> initializing of neccesery data.
>
> Found by Linux Driver Verification project (linuxtesting.org).
>
> Fixes: 90fccb529d24 ("usb: gadget: Gadget directory cleanup - group UDC drivers")
> Signed-off-by: Nadezda Lutovinova <lutovinova@ispras.ru>

Thanks for updating so quickly:

Acked-by: Felipe Balbi <balbi@kernel.org>

-- 
balbi
