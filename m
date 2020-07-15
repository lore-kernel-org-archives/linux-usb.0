Return-Path: <SRS0=G55A=A2=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D651C433E1
	for <linux-usb@archiver.kernel.org>; Wed, 15 Jul 2020 13:23:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D9B4220578
	for <linux-usb@archiver.kernel.org>; Wed, 15 Jul 2020 13:23:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YGColpXc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731618AbgGONXK (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 15 Jul 2020 09:23:10 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:46411 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731443AbgGONXK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jul 2020 09:23:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594819389;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=O8K6GZRV/hKNth1LqWr26/rv+mV9QVVFmk/IWvqZulE=;
        b=YGColpXcevLAFTic62YjdCuDWup7VWHCItZgLv41neEAYRVO1NxhFy7G6DtRWWeq+gjgEN
        Gd5yb5ehaZlVGxHSEjj9KQZb3vk1UC7EufDtadTNhCKnayOWjhpnm6DvLhNybXXoGNLrCj
        1ZnAESNNBNxk+yfYPZ53YPf8kCKb2rY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-iovU-DeOOV-AbSx65P6JXQ-1; Wed, 15 Jul 2020 09:23:05 -0400
X-MC-Unique: iovU-DeOOV-AbSx65P6JXQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14CB41086;
        Wed, 15 Jul 2020 13:23:04 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-113-224.ams2.redhat.com [10.36.113.224])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E50AE60BF4;
        Wed, 15 Jul 2020 13:23:02 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
Subject: [PATCH 0/6] usb: typec: tcpm: Fix AB BA lock inversion between tcpm and alt-mode drivers
Date:   Wed, 15 Jul 2020 15:22:55 +0200
Message-Id: <20200715132301.99816-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi All,

Here is a patch series which fixes an AB BA lock inversion between thr
tcpm code and alt-mode drivers (seen with the display-port alt-mode driver).

The actual fix is in patch 5. I could have just done an unlock before and
a re-lock after all the troublesome typec_altmode_foo(adev, ...) calls, but
I've done some reshuffling in patches 1-4 to make it clearer that when the
unlock happens we are really done with the port-state so it is ok to unlock
then.

Patch 6 is a bonus patch which adds an extra sanity check (WARN_ON) for a
potential issue which I noticed while working on this.

Regards,

Hans


