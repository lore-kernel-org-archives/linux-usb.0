Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9385745000;
	Sun, 16 Aug 2026 05:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786857679; cv=none; b=UgMeHItWfR4DvhvXOMxmvzzwy6ufnibUuSaI2NseLLR466as7kj1+R7ejWoQTBJ0xLDozirjYpJYTOTuJI83DqJt8dF+smnwPrfxx1uBh98+hoxWuuN7Kkkazn2h5tHTXa8iy7s4PiqPwRqp0lhcOsmfgsp2Ak589FJBaZ9s1zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786857679; c=relaxed/simple;
	bh=wkD+puIDwH8X5KcAPo5+8dzCJMmaOS+fabuqW1fkf5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kdBd+QZf33Qf3sEkysgELIop+WCkK26nHwK7PMmZF9WjYfvFPjkRetPidlonYg8HwQQ9cakbM9cJiNA3hy26nCGF+vp8lKOwR9L30o9x2SazZ8jt/2mWrUdIBUZ//RlZ8Kg7BEx/gRzpv9QPvlAvhQTmzORP7lp8JmwtcBOCh/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fUTiFcvj; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fUTiFcvj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786857678; x=1818393678;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wkD+puIDwH8X5KcAPo5+8dzCJMmaOS+fabuqW1fkf5o=;
  b=fUTiFcvjM8DlV+6zQuErkqXslTRK+6LOf82da78PYcQgAouSOqIP7s/Q
   TtbfDi89VBT1XmlVgP9v+LtSnXENTNwBELS+HuB8HLC4u7Nu6/7yjw+G1
   RK2miQhrDRjIYZbK0BBhMbHl4M65QKHxbwhw0LJF306ndpNMhbuJVQSnC
   UaEI4nhNqzWDTcSFkH14zx+BaImiDUhHtEcT9Ue8gRtJQDtp5tmm7lxuR
   zRGjGLDR//Oy5ia2Dbs7OHg3OmZm3KQ+KZNXe878PDcgosqAwZVYZ6lve
   FtTHvWKg+auyOym3Uco63VVUN/XgvuZcjSojLtBmc7E5S6E3NJ6/GnU63
   Q==;
X-CSE-ConnectionGUID: egZcs64vT0GEsg4Hw9wF9A==
X-CSE-MsgGUID: inxMx69HRV2ixEu/Rs6Mbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="89889057"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="89889057"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 22:21:17 -0700
X-CSE-ConnectionGUID: 0rXfYLmnQnmfOM4eSrY5ZQ==
X-CSE-MsgGUID: Edb951HeR0eQwvARDEzx/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="265204091"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 15 Aug 2026 22:21:16 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvTJ3-000000006YP-1XVL;
	Sun, 16 Aug 2026 05:21:13 +0000
Date: Sun, 16 Aug 2026 07:20:59 +0200
From: kernel test robot <lkp@intel.com>
To: Pol =?iso-8859-1?Q?Fern=E1ndez_Fern=E1ndez?= <fernandezfernandezpol@gmail.com>,
	linux-media@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, laurent.pinchart@ideasonboard.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pol =?iso-8859-1?Q?Fern=E1ndez_Fern=E1ndez?= <fernandezfernandezpol@gmail.com>
Subject: Re: [PATCH 2/2] media: uvcvideo: add device entry for Logitech C920
 (046d:08e5)
Message-ID: <202608160712.l89JPkSj-lkp@intel.com>
References: <20260629163805.37879-2-fernandezfernandezpol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629163805.37879-2-fernandezfernandezpol@gmail.com>

Hi Pol,

kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-pending/master]
[also build test ERROR on media-tree/master sailus-media-tree/master linus/master v7.2-rc7 next-20260721]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pol-Fern-ndez-Fern-ndez/media-uvcvideo-add-device-entry-for-Logitech-C920-046d-08e5/20260814-213320
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20260629163805.37879-2-fernandezfernandezpol%40gmail.com
patch subject: [PATCH 2/2] media: uvcvideo: add device entry for Logitech C920 (046d:08e5)
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260816/202608160712.l89JPkSj-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608160712.l89JPkSj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608160712.l89JPkSj-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/usb/uvc/uvc_queue.c: In function 'uvc_queue_buffer_complete':
>> drivers/media/usb/uvc/uvc_queue.c:360:14: error: implicit declaration of function 'uvc_queue_to_stream'; did you mean 'uvc_queue_streaming'? [-Wimplicit-function-declaration]
     360 |             (uvc_queue_to_stream(queue)->dev->quirks & UVC_QUIRK_DROP_STREAM_ERR))) {
         |              ^~~~~~~~~~~~~~~~~~~
         |              uvc_queue_streaming
>> drivers/media/usb/uvc/uvc_queue.c:360:40: error: invalid type argument of '->' (have 'int')
     360 |             (uvc_queue_to_stream(queue)->dev->quirks & UVC_QUIRK_DROP_STREAM_ERR))) {
         |                                        ^~


vim +360 drivers/media/usb/uvc/uvc_queue.c

   352	
   353	static void uvc_queue_buffer_complete(struct kref *ref)
   354	{
   355		struct uvc_buffer *buf = container_of(ref, struct uvc_buffer, ref);
   356		struct vb2_buffer *vb = &buf->buf.vb2_buf;
   357		struct uvc_video_queue *queue = vb2_get_drv_priv(vb->vb2_queue);
   358	
   359		if (buf->error && (!uvc_no_drop_param ||
 > 360		    (uvc_queue_to_stream(queue)->dev->quirks & UVC_QUIRK_DROP_STREAM_ERR))) {
   361			uvc_queue_buffer_requeue(queue, buf);
   362			return;
   363		}
   364	
   365		buf->state = buf->error ? UVC_BUF_STATE_ERROR : UVC_BUF_STATE_DONE;
   366		vb2_set_plane_payload(&buf->buf.vb2_buf, 0, buf->bytesused);
   367		vb2_buffer_done(&buf->buf.vb2_buf, buf->error ? VB2_BUF_STATE_ERROR :
   368								VB2_BUF_STATE_DONE);
   369	}
   370	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
