Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1472F7F03;
	Tue, 23 Jun 2026 15:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782229212; cv=none; b=cwZNItM1E88hwMx2dYF5uOdisX+N0/TVB3jMHjGgHwgLdQ8AWWon8fpXf2pi96n00uC4J4lTQ6ZO81a5pSWmlKFynNFn15gqchcUOfVFTjjL1LmxNqkex0tFTtrqa/iAUxNkGXsZsGkZyBK7MljJWmo0GUe4QupryEHmZpbzvEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782229212; c=relaxed/simple;
	bh=FNuXZRSRMwjLXk8PCnp/YzPqQl2iSZqcRjd65vw4PmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dLWKBpYcJJTroVmSJ9mpSOxYD5YJFatF/mzCo7yJQHDvpZz2/VG1pTJqgkhGJMKSqY4BUI3msfZ66GVVntSS9Zk7THOlSRa2tAE9UZ1gbJPMHCKec4gu0BqX0aiDRigkGcBdDfIiK2sidWFA5xMaplFsjjXb8qCR/7qlsSTa4xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PG0v8hTQ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PG0v8hTQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782229210; x=1813765210;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FNuXZRSRMwjLXk8PCnp/YzPqQl2iSZqcRjd65vw4PmQ=;
  b=PG0v8hTQrrOOHbsYgsX/KoF+8iW7Ku7d9IOyxZUXJ62mguXKSZUUHU0L
   A7/cZmGP5Vbb3Ss6Z35vIo1r9pbPZENlCju4UMdlO2IVfgR/oFH5ijBQv
   nLJdmZ6jNwLPc3kElY3XfBFZRYXqE97e+ST6rKxyqW4aWyGMAYrJVFRwc
   QCO+xkj9g38aVmzCRNF/Ccb0YSPorS+egh4HkYGAeKB4s8X46EmMH0mox
   txbb51NG9Gfkd30aITUyg5j379Qpkh0wHMKNi4BYlOlgJXBoy1124tE2M
   K746Mugbtfm7K8Gxe6OMsNn4aBDMxQ3d5O9bY288+YefjGcTsedoOhdWE
   g==;
X-CSE-ConnectionGUID: eGic0XjXQvaXa+72vNG9kQ==
X-CSE-MsgGUID: 9PG/X/IbRFuX/Znl9c9Xbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="86880556"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="86880556"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 08:40:09 -0700
X-CSE-ConnectionGUID: EsFS0LIGSiu3XX+FoumXGQ==
X-CSE-MsgGUID: cCNCKrfwQpW0b7OnP6XL+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="249659281"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 23 Jun 2026 08:40:07 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 50F4495; Tue, 23 Jun 2026 17:40:06 +0200 (CEST)
Date: Tue, 23 Jun 2026 17:40:06 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: raoxu <raoxu@uniontech.com>
Cc: andreas.noever@gmail.com, westeri@kernel.org, YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] thunderbolt: fix bandwidth group reservation indexing
Message-ID: <20260623154006.GF3066@black.igk.intel.com>
References: <E53B82E8FA767BC5+20260623133759.3019094-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <E53B82E8FA767BC5+20260623133759.3019094-1-raoxu@uniontech.com>

Hi,

On Tue, Jun 23, 2026 at 09:37:59PM +0800, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> Group ID 0 is reserved, while valid bandwidth groups use IDs 1 through
> 7. MAX_GROUPS is used both for tb_cm::groups, which stores allocatable
> bandwidth groups, and for group_reserved[], which is indexed directly
> by Group ID.
> 
> tb_init_bandwidth_groups() assigns i + 1 to each entry in
> tb_cm::groups. Keeping seven entries therefore creates exactly the valid
> Group IDs 1 through 7.
> 
> However, group_reserved[MAX_GROUPS] currently also has seven entries,
> providing indices 0 through 6. When a tunnel belongs to Group ID 7,
> tb_consumed_dp_bandwidth() reads and may write one element past the end
> of the array. The reservation for that group is consequently not
> included in the consumed bandwidth total either.
> 
> Define MAX_GROUPS as 7 + 1 so arrays indexed directly by Group ID cover
> the complete 0 through 7 range, including the reserved ID 0. Size
> tb_cm::groups as MAX_GROUPS - 1 so only seven bandwidth group objects
> are initialized and tb_init_bandwidth_groups() continues to assign IDs
> 1 through 7. tb_consumed_dp_bandwidth() can then retain the direct
> Group ID indexing, with Group ID 7 selecting the final valid array
> element instead of accessing beyond it.
> 
> Fixes: 52a4490e89d7 ("thunderbolt: Reserve released DisplayPort bandwidth for a group for 10 seconds")
> Signed-off-by: Xu Rao <raoxu@uniontech.com>
> ---
> Changes in v2:
> - Drop the zero-based Group ID conversion used in v1 and keep
>   group->index as the direct group_reserved[] index.
> - Include the reserved Group ID 0 in MAX_GROUPS so direct-indexed arrays
>   cover the complete Group ID range 0 through 7.
> - Size tb_cm::groups as MAX_GROUPS - 1 so
>   tb_init_bandwidth_groups() continues to create only the seven valid
>   groups with IDs 1 through 7.
> 
>  drivers/thunderbolt/tb.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index 76323255439a..51f909db9383 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -41,7 +41,7 @@
>   */
>  #define TB_ASYM_THRESHOLD	45000
> 
> -#define MAX_GROUPS		7	/* max Group_ID is 7 */
> +#define MAX_GROUPS		(7 + 1) /* Group ID 0 is reserved */
> 
>  static unsigned int asym_threshold = TB_ASYM_THRESHOLD;
>  module_param_named(asym_threshold, asym_threshold, uint, 0444);
> @@ -66,7 +66,7 @@ struct tb_cm {
>  	struct list_head dp_resources;
>  	bool hotplug_active;
>  	struct delayed_work remove_work;
> -	struct tb_bandwidth_group groups[MAX_GROUPS];
> +	struct tb_bandwidth_group groups[MAX_GROUPS - 1];

Why this? We still need to be able to put there GroupIDs 1 to 7 (and keep
the 0 as is).

>  };
> 
>  static inline struct tb *tcm_to_tb(struct tb_cm *tcm)
> --
> 2.50.1
